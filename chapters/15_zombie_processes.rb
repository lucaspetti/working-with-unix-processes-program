class ZombieProcesses < ChapterBase
  def initialize
    @title = 'Chapter 15: Zombie Processes'
  end

  def print_content
    puts 'Any dead process whose status has not been waiter on is a zombie process.'
    # Create a child process
    pid = fork { sleep 3 }
    # Detach it
    Process.detach(pid) # BUG in Ruby when running Process.detach(pid).thread_variables
    zombie_pid = fork { sleep 1 }
    puts zombie_pid
    puts "Check status of #{zombie_pid} while this process sleeps for a while"
    puts "Type: ps -ho pid,state -p #{zombie_pid} in the terminal"

    puts 'After checking, type anything to proceed'
    STDIN.gets
    Process.waitpid2 zombie_pid
  end
end
