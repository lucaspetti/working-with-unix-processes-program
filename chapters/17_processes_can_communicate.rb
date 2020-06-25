class ProcessesCommunicate < ChapterBase
  def initialize
    @title = 'Chapter 17: Processes Can Communicate'
  end

  def print_content
    puts 'Creating pipe...'
    reader, writer = IO.pipe
    puts reader, writer
    writer.write('Writing into pipe...')
    writer.close
    puts reader.read

    puts 'Now creating a child that will write to another pipe...'
    reader, writer = IO.pipe
    fork do
      reader.close
      5.times { writer.puts 'Writing to pipe' }
      at_exit { writer.puts 'Quiting child process...' }
    end

    writer.close
    while message = reader.gets
      $stdout.puts message
    end
  end
end

# Example of a UNIX socket, which has bi-directional communication:

# require 'socket'

# child_socket, parent_socket = Socket.pair(:UNIX, :DGRAM, 0)
# maxlen = 1000

# fork do
#   parent_socket.close
#   4.times do
#     instruction = child_socket.recv(maxlen)
#     child_socket.send("#{instruction} accomplished!", 0)
#   end
# end

# child_socket.close

# 2.times { parent_socket.send("Heavy lifting", 0) }

# 2.times { parent_socket.send("Feather lifting", 0) }

# 4.times { $stdout.puts parent_socket.recv(maxlen) }