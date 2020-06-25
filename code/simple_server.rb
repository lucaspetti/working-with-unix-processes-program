require 'socket'

class SimpleServer
  def initialize
    @server = TCPServer.new 5678
  end

  def run
    puts "[#{Process.pid}] is listening on port 5678"
    return http_server if http?

    while session = @server.accept
      session.puts "Current time is #{Time.now}"
      session.close
    end
  end

  def http_server
    while session = @server.accept
      request = session.gets
      puts request

      session.print "HTTP/1.1 200\r\n" # 1
      session.print "Content-Type: text/html\r\n" # 2
      session.print "\r\n" # 3
      session.print "Current time is #{Time.now}" # 4

      session.close
    end
  end

  def http?
    ARGV.include?('--http')
  end
end
