require 'yaml'

class Configuration
  
  def initialize
    #@mongo []
    #@memcache []
  end
  def mongo
    @mongo
  end
  
  def memcache
    @memcache
  end
  
  def parceConf
    parcer = begin 
    YAML.load(File.open("./config/datasource.yaml"))
    rescue ArgumentError => e
      puts "Could not parce yaml: #{e.message}"
    end 

    parcer.each do |system, config|
      case system 
        when "mongo"
          @mongo []
          @mongo["host"] = config["host"]
          @mongo["port"] = config["port"]
          @mongo["database"] = config["database"]
        when "memcache"
          @memcache["host"] = config["host"]
          @memcache["port"] = config["port"]
          @memcache["database"] = config["database"]
        else
          puts "Error in config!" 
       end  
    end
  end
end

conf = Configuration.new()
conf.parceConf
puts conf.memcache["host"] 
