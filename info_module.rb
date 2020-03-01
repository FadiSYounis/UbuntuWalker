require 'bundler'
require 'pathname'
require 'fileutils'
require 'pg'

class FileWalker

  def initialize(opts)
    @opts = opts
    @connection = PG.connect(:host=> "10.6.0.84", :dbname => 'dataset', :user => 'fyounis', :password => 'Baatman1')
  end

  attr_reader :opts



  def FileInfoExtractor!(f)
    if (File.file?(f))
      #print(f)
      get_file_size!(f)
      get_file_lines_of_code!(f)
      @connection.exec("INSERT INTO datastats (filename, type, size, loc) VALUES ('#{f}', '#{f.split('/')[1]}', #{get_file_size!(f)}, #{get_file_lines_of_code!(f)});")
    end
  end

  #SIZE of FILE in BYTES
  def get_file_size!(f)
    size = File.size?(f)
    #print("#{size},")
  end


  #LINES of CODE COUNT
  def get_file_lines_of_code!(f)
    count = 0;
    File.foreach(f) {count+=1}
    #print("#{count}")
    count
  end

  def folder_processor(dump_folder)
    Dir[dump_folder].each do |folder|
      Dir.foreach(folder) do |file|
        FileInfoExtractor!(file)
      end
    end
  end
end