class ProcessArguments < ChapterBase
  def initialize
    @title = 'Chapter 8: Processes Have Arguments'
  end

  def print_content
    puts 'Processes can be called with arguments, which can be accessed on an array called ARGV'
    puts 'Current arguments for this process:'
    puts ARGV
    separator
    puts 'NOTE: To see the help menu for this program, you can quit and run bin/execute --help'
  end
end
