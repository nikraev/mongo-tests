require_relative '../config/mongo.conf'

class MongoData
  
  def initialize(host, port, database)
    #В будущем необъходимо подключить конфиг
    @host = host  
    @port = port
    @database = database
    
  end
  
  def configMongo
         
  end
  
  def saveObject(doc)
     @connect = self.getConnection
     
  end
  
  def findObjectbyName(name)
    @connect = self.getConnection
    result = @connect[:"#{@collection}"].find(:name => "#{name}")
    result  
  end

protected
  def getConnection
    client = Mongo::Client.new(["#{@host}:#{@port}"], :database => @database)
    client
  end
end