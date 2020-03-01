require_relative 'lister'
require 'trollop'

class ListRun
  def run
    opts = Trollop::options do
      banner "Lister Command Line"
      opt :source, "UNTAR FILES FROM HERE", :type => :string, :default => "ubuntu"
      opt :redis_url, "REDIS URL", :type => :string, :default => "redis://127.0.0.1:6379"
    end
    runner = Lister.new(opts)
  end
  r = ListRun.new
  r.run()
end