require 'mongo'

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
 #   puts "Connection refusing" if @connect.nil? 
  end
  
  def findObject()
    @connect = self.getConnection
        
  end

protected
  def getConnection
    client = Mongo::Client.new(["#{@host}:#{@port}"], :database => @database)
    client
  end
  
end

class Flowers < MongoData
    def initialize(host,port,database)
      super(host,port,database)
      @collection = 'flowers'
    end 
    
    def saveObject(name,cost)
      connect = self.getConnection
      puts "no connection" if connect.nil?
      result = connect[:"#{@collection}"].insert_one( {name: "#{name}"} ) 
    end
end

class User < MongoData
  def initialize(host,port,database)
    super(host,port,database)
    @collection = 'user'
  end
  
  def saveObject(name,email,phone)
    super(@connect)
    puts "no connection" if @connect.nil?
    result = @connect[:"#{@collection}"].insert_one( {name: "#{name}", email: "#{email}", phone: "#{phone}"} ) 
  end
end


f1 = Flowers.new('127.0.0.1',27017, 'site')
f1.saveFlower('Rose')

u1 = User.new('127.0.0.1',27017, 'site')
u1.saveObject("Kolia","nikraev@yandex.ru","1001")
