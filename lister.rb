require 'redis'
require "find"



class Lister

  def initialize(opts)
    @opts = opts

    redis = Redis.new(url:opts[:redis_url])
    redis.del 'filequeue'

    if(Dir.exist?(opts[:source]))
      #puts "Opening folder #{opts[:source]}"

      filelist = Find.find(opts[:source]).select{ |f| f =~ /tar/}

      puts
      #p 'pushing filelist items into queue'
      filelist.each { |item| redis.rpush 'filequeue', item}

      puts
      #p 'contents of file QUEUE'
      p redis.lrange('filequeue', 0, -1)

      puts
      #p 'length of file QUEUE'
      p  redis.llen('filequeue')
    end
  end
end
