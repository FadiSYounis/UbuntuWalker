
require "trollop"
require 'redis'
require "find"

opts = Trollop::options do
  banner "Info Runner Command Line"
  opt :dump, "READ CODE FILES HERE", :type => :string, :default => "dump"
  opt :redis_url, "REDIS URL", :type => :string, :default => "redis://127.0.0.1:6379"
end

    info_redis = Redis.new(url:opts[:redis_url])
    info_redis.del 'fileinfoqueue'

    if(Dir.exist?(opts[:dump]))
      puts "Opening folder #{opts[:dump]}"

      fileinfolist = Find.find(opts[:dump]).select{|f| File.file?(f)}

      puts
      #p 'pushing filelist items into queue'
      fileinfolist.each { |item| info_redis.rpush 'fileinfoqueue', item}

      puts
      #p 'contents of file QUEUE'
      p info_redis.lrange('fileinfoqueue', 0, -1)

      puts
      #p 'length of file QUEUE'
      p  info_redis.llen('fileinfoqueue')
    end


