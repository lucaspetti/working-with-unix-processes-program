class ProcessSignals < ChapterBase
  def initialize
    @title = 'Chapter 16: Processes Can Get Signals'
    @child_processes = 3
    @dead_processes = 0
  end

  def print_content
    puts 'You can use a signal so the parent does not get blocked while waiting'
    @child_processes.times { fork { sleep 3 } }

    # Sync $stdout so the call to #puts in the CHLD handler isn't
    # buffered. Can cause a ThreadError if a signal handler is
    # interrupted after calling #puts. Always a good idea to do this if your handlers will be doing IO.
    $stdout.sync = true

    # For more on signals check https://ruby-doc.org/core-2.5.0/Signal.html

    trap(:CHLD) do
      while pid = Process.wait(-1, Process::WNOHANG)
        puts ''
        puts "#{pid} finished and signal received"
        @dead_processes += 1
        puts 'Child processes finished' if @dead_processes == @child_processes
      end
    rescue Errno::ECHILD => e
      puts "#{e.inspect} raised. Some error with a signal"
    end

    print 'Child processes running on background'
    loading_dots while @dead_processes != @child_processes
  end
end
