require 'yaml'


parcer = begin 
YAML.load(File.open("../config/datasource.yaml"))
rescue ArgumentError => e
  puts "Could not parce yaml: #{e.message}"
end 


puts "no Value" if parcer.nil?

parcer.each do |system, config|
  case system 
    when "mongo"
      mongo_host = config["host"]
      mongo_port = config["port"]
      mongo_database = config["database"]
    when "memcache"
      memcache_host = config["host"]
      memcache_port = config["port"]
      memcache_database = config["database"] 
  end  

puts  "#{mongo_host} and #{memcache_database}"
end
