require_relative '01_chapter_base'

class ProcessID < ChapterBase
  def initialize(process)
    @title = 'Chapter 3: Processes Have IDs'
    @process = process
  end

  def print_id
    puts "The process pid is #{@process.id}"
  end

  def print_content
    puts "This process is running on pid #{@process.pid}"
    puts 'To see how the process is referenced on the terminal, open another tab and type:'
    puts "ps #{@process.pid}"
    puts ''
    puts 'Note: Ruby\'s Process.pid maps to getpid(2).'
  end
end
