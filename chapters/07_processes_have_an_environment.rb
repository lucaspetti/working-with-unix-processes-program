class ProcessEnvironment < ChapterBase
  def initialize
    @title = 'Chapter 7: Processes Have An Environment'
  end

  def print_content
    puts 'Every process inherits environment variables from its parent'
    puts 'A simple example is to run the following on a bash shell:'
    puts ''
    puts '$ MESSAGE="wing it" ruby -e "puts ENV[\'MESSAGE\']"'

    puts 'VAR=value is the bash way of setting environment variables'
    puts 'The Ruby way is to use the ENV constant like:'

    puts "ENV['MESSAGE'] = 'wing it'"
    puts 'Then to print it you can run system "echo $MESSAGE"'
    separator
    puts 'ENV is not actually a Hash, as some methods like #merge are not implemented'
    puts 'If you want to see the current full ENV for this process, press 0'
    input = STDIN.gets
    puts ENV.to_h if input.to_i.zero?
  end
end
