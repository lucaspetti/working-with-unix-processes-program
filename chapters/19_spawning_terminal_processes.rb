class TerminalProcesses < ChapterBase
  def initialize
    @title = 'Chapter 19: Spawning Terminal Processes'
  end

  def print_content
    puts 'Spawning a process with IO.popen. It will run the ls command:'
    separator
    puts IO.popen('ls').read
    separator

    puts 'Spawning with system (blocking way)'
    system 'sleep 5'

    puts 'Spawning with Process.spawn'
    Process.spawn 'sleep 5'
  end
end

# Examples with open3

# require 'open3'

# Open3.popen3('grep', 'data') { |stdin, stdout, stderr|
#   stdin.puts "some\ndata"
#   stdin.close
#   puts stdout.read
# }

# Open3 will use Process.spawn when available. Options can be passed to Process.spawn like so:
# Open3.popen3('ls', '-uhh', :err => :out) { |stdin, stdout, stderr| puts stdout.read }
