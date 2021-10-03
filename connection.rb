require 'mysql2'

class Connection
  attr_reader :host, :database, :username, :password

  def initialize
    @host = String('localhost')
    @database = String('ibcsystem_development')
    @username = String('root')
    @password = String('Toor@processo_zumbi38!')
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

  def close
    client.close # Cleanup
    puts 'Done.'
  end
end
