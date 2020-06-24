require_relative '01_chapter_base'

class ProcessID < ChapterBase
  def initialize
    @title = 'Chapter 3: Processes Have IDs'
  end

  def print_id
    puts "The process pid is #{Process.id}"
  end

  def print_content
    puts "This process is running on pid #{Process.pid}"
    puts 'To see how the process is referenced on the terminal, open another tab and type:'
    puts "ps #{Process.pid}"
    puts ''
    puts 'Note: Ruby\'s Process.pid maps to getpid(2).'
  end
end
