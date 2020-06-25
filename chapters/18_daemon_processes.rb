class DaemonProcesses < ChapterBase
  def initialize
    @title = 'Chapter 18: Daemon Processes'
  end

  def print_content
    puts 'Creating Daemon process...'
    pid = create_daemon
    puts "Created daemon process #{pid}"
  end

  def create_daemon
    # What happens behind the scenes with the method Process.daemon:
    # exit if fork
    # Process.setsid
    # exit if fork
    # Dir.chdir '/'
    # STDIN.reopen '/dev/null'
    # STDOUT.reopen '/dev/null', 'a'
    # STDERR.reopen '/dev/null', 'a'
    fork { Process.daemon }
  end
end
