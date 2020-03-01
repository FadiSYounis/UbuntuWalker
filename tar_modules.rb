require 'bundler'
require 'pathname'
require 'rubygems/package'
require 'zlib'
require 'xz'
#require 'bzip2/ffi'
require 'rbzip2'
require 'fileutils'
#require 'mime/types'
require "find"
require 'securerandom'
#require 'filemagic'
require 'digest'

class TarWalker

  def initialize(opts)
    @opts = opts
    @accepted_ext = { ".c" => "C",
                      ".CPP" => "C++",
                      ".cxx" => "C++",
                      ".cc" => "C++",
                      ".CXX" => "C++",
                      ".cpp" => "C++",
                      ".java" => "Java",
                      ".py"    => "Python",
                      ".rb" => "Ruby",
                      ".js" => "Javascript"
    }
  end

  attr_reader :accepted_ext
  attr_reader :opts

  def tar_reader_gz!(f)
    tarEntryProcessor!(f, Zlib::GzipReader)
  end


  def tar_reader_bz2!(f)
    if system("bunzip2 -c -d #{f}| gzip -v9 > tmp$RANDOM.tar")
      if(File.extname(f).eql?(".tar"))
        tarEntryProcessor!(f, Zlib::GzipReader)
        system("rm *.tar")
      end
    end
  end

  def tar_reader_xz!(f)
    tarEntryProcessor!(f, XZ::StreamReader)
  end

  def tarExtractor!(f)
    if (File.file?(f))
      if (File.extname(f).eql?(".gz"))
        tar_reader_gz!(f)
      elsif (File.extname(f).eql?(".bz2"))
        tar_reader_bz2!(f)
      elsif (File.extname(f).eql?(".xz"))
        tar_reader_xz!(f)
      end
    end
  end

  def pathCreator!(dump_folder, code_path, e)
    path = File.join(dump_folder, code_path)
    Dir.mkdir(path) unless File.exists?(path)
    buffer = e.read
    random=Digest::SHA256.hexdigest buffer.to_s
    File.open(random, "w") {|f| f.write(buffer)}
    begin
      FileUtils.mv(random, path)
    rescue Errno::EEXIST
        puts "Skipping file #{random}"
    end
  end

  def tarEntryProcessor!(f, reader_type)
    tar_extract = Gem::Package::TarReader.new(reader_type.open(f))
    tar_extract.rewind # The extract has to be rewinded after every iteration
    tar_extract.each do |entry|
      if entry.file?
        file_ext = File.extname(entry.full_name)
        if @accepted_ext.has_key?(file_ext)
          #puts "< #{@accepted_ext[file_ext]} file extension - #{file_ext}>--------<copying #{entry.full_name}> ---------in .gz file with path <#{f}>"
          pathCreator!(opts[:dump], @accepted_ext[file_ext], entry)
        end
      end
    end
    tar_extract.close
  end
end
