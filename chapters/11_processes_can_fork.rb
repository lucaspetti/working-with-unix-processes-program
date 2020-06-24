class ProcessForks < ChapterBase
  def initialize
    @title = 'Chapter 11: Processes Can Fork'
  end

  def print_content
    puts 'The fork system call allows a running process to create new processes.'
    puts 'This new process is an exact copy of the original process.'
    puts 'When forking, the process that initiates the fork is called the "parent" and the newly created is called the "child"'
    puts ''
    puts 'The child process inherits a copy of all of the memory in use by the parent, as well as any open file descriptors.'
    puts 'The child process gets its own unique pid'
    separator
    puts 'Creating a child process...'
    puts ''
    create_fork
    sleep 2
    puts ''
    puts 'Created child process with a block'
  end

  def print_child_content
    separator
    puts "-- Hello world from child process with pid #{Process.pid} --"
  end
end
