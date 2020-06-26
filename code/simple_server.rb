require 'socket'

class SimpleServer
  def initialize
    @server = TCPServer.new port
  end

  def run
    puts "[#{Process.pid}] is listening on port #{@server.addr[1]}"
    start_server
  end

  private

  def start_server
    while session = @server.accept
      http? ? http_protocol(session) : print_time(session)
      session.close
    end
  end

  def http_protocol(session)
    request = session.gets
    puts request

    session.print "HTTP/1.1 200\r\n" # 1
    session.print "Content-Type: text/html\r\n" # 2
    session.print "\r\n" # 3
    print_time(session) # 4
  end

  def print_time(session)
    session.puts "Current time is #{Time.now}"
  end

  def http?
    ARGV.include?('--http')
  end

  def port
    ARGV.include?('--port') ? ARGV[ARGV.index('--port') + 1] : 5678
  end
end
