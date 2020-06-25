require 'socket'

server = TCPSocket.new 'localhost', 5678

puts "[#{Process.pid}] reading from port 5678"

while line = server.gets
  puts line
end

server.close
