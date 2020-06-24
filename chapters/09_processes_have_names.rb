class ProcessNames < ChapterBase
  def initialize
    @title = 'Chapter 9: Processes Have Names'
  end

  def print_content
    puts 'There are two mechanisms that operate at the level of the process itself that can be used to communicate information.'
    puts 'One is the process name, the other is exit codes'
    puts "The current process name is #{$PROGRAM_NAME}"
    puts ''
    puts 'Changing current process name to RUBY_PROGRAM...'
    $PROGRAM_NAME = 'RUBY_PROGRAM'
    puts "New process name: #{$PROGRAM_NAME}"
    puts "You can check by typing ps #{Process.pid} in another terminal tab"
  end
end
