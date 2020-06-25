require_relative '01_chapter_base'

class ProcessWait < ChapterBase
  def initialize
    @title = 'Chapter 14: Processes Can Wait'
  end

  def print_content
    puts 'Creating a child process and waiting for it to end...'
    create_and_wait

    puts 'Now creating 2 child processes and waiting for them...'
    2.times { create_and_wait }

    puts 'Process.wait2 returns the pid and status'
    puts ''
    [1, 2].each { |exit_number| create_and_wait2(exit_number) }

    puts 'Now using Process.waitpid to wait for a specific child...'
    pid = fork { sleep 5 }
    puts "PID: #{pid}"
    puts Process.waitpid(pid) # If -1 is passed, it waits for any child process
    # Process.wait accepts a pid as an argument too. Same for Process.wait2 and Process.waitpid2
    separator

    puts 'Now doing a slow babysitting. Creating two child processes...'
    puts ''
    2.times { fork { puts 'Child Process finished.' } }
    puts ''
    puts Process.wait
    puts 'Not waiting for the second one yet'
    sleep 3
    puts ''
    puts Process.wait
    puts 'Done.'
    # Calling Process.wait when there are no child processes will raise Errno::ECHILD
  end

  def create_and_wait
    create_fork
    puts "Finished #{Process.wait}"
    separator
  end

  def create_and_wait2(exit_number)
    create_fork { exit exit_number }
    puts "Process.wait2 => #{Process.wait2}"
    separator
  end

  def print_child_content
    print 'Running child process.'
    sleep 1.5
    print '.'
    sleep 1.5
    print '.'
    puts ''
  end
end
