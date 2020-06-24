class ProcessExitCodes < ChapterBase
  def initialize
    @title = 'Chapter 10: Processes Have Exit Codes'
  end

  def print_content
    puts 'The exit code is the last way of communication of a process'
    puts ''
    puts 'A process that exits with an exit code of 0 is said to be successful'
    puts ''
    puts 'using just "exit" will exit the program with the success status code of 0'
    puts 'The method can receive a number for a custom exit code.'
    separator
    puts 'The "at_exit" method accepts a block with a given command.'
    puts 'To test this, you can type a message to be printed on exit and the program will quit. Or type 1 to move on'
    puts ''
    input = STDIN.gets
    exit_with_message(input) unless input.to_i == 1

    puts 'The method "exit!" will not call at_exit and will exit with an unsuccessful status code by default'
    puts ''
    puts 'The method "abort" exits with code 1 and a message can be passed to it. It will also call the at_exit block before exiting.'
    puts ''
    puts 'The method "raise" will raise an exception, if it is not rescued it will cause the process to exit.'
    puts 'A process ended with raise will still invoke any at_exit handlers and print the exception message and backtrace to STDERR'
    puts 'Type "raise" to raise and exception that will quit this program:'
    input = STDIN.gets.chomp
    raise_error if input == 'raise'
  end

  def exit_with_message(input)
    puts 'Exiting...'
    at_exit { puts input }
    exit
  end

  def raise_error
    puts ''
    at_exit { puts 'Always remember to not call undefined methods for NIL...' }
    nil.execute!
  end
end
