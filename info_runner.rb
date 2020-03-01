require_relative 'info_module'
require "trollop"
require 'redis'

class Information_Runner
  def info_run
    opts = Trollop::options do
      banner "Info Runner Command Line"
      opt :dump, "READ CODE FILES HERE", :type => :string, :default => "dump"
      opt :redis_url, "REDIS URL", :type => :string, :default => "redis://127.0.0.1:6379"
    end
    ir_redis = Redis.new(url:opts[:redis_url])
    #p opts
    ir_runner = FileWalker.new(opts)
    while true
      item = ir_redis.lpop("fileinfoqueue")
      if item.nil?
        puts "queue was empty, exit queue."
        exit
      else
        ir_runner.FileInfoExtractor!(item )
      end
    end
  end
  ir = Information_Runner.new( )
  ir.info_run()
end
