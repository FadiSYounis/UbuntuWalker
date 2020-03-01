require_relative 'tar_modules'
require "trollop"
require 'redis'

class Runner
	def run
		opts = Trollop::options do
			banner "Ubuntu Walker Command Line"
			opt :dump, "DUMP CODE FILES HERE", :type => :string, :default => "dump"
			opt :redis_url, "REDIS URL", :type => :string, :default => "redis://127.0.0.1:6379"
		end
		redis = Redis.new(url:opts[:redis_url])
		#p opts
		Dir.mkdir(opts[:dump]) unless File.exists?(opts[:dump])
		runner = TarWalker.new(opts)
		while true
			item = redis.lpop("filequeue")
			if item.nil?
				puts "queue was empty, exit queue."
				exit
			else
				runner.tarExtractor!(item )
			end
		end
	end
	r = Runner.new( )
	r.run()
end

