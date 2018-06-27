require 'singleton'
class AdvLogger
    include Singleton
    def initialize
        @logads = File.open("adslog.csv","a")
    end

    def logAds(*val)
        out = val.join(",")
        @logads.puts(out)
        @logads.flush
    end
end

