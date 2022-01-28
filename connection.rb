require 'mysql2'

class Connection
  attr_reader :host, :database, :username, :password
  def initialize
    @host = String('localhost')
    @database = String(ENV["database"])
    @username = String(ENV["username"])
    @password = String(ENV["passwd"])
  end


  def open
    begin
    # Initialize connection object
    client = Mysql2::Client.new(host: host,
                                username: username,
                                database: database, 
                                password: password)
    
    rescue Exception => e
      puts e.message
    end               
    client
  end
end
