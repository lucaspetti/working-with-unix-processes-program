require_relative '01_chapter_base'

class ProcessParents < ChapterBase
  def initialize
    @title = 'Chapter 4: Processes Have Parents'
  end

  def print_content
    puts 'Every process has a parent process, which has the identifier as ppid'
    puts "This process has the pid #{Process.pid} and the parent has the pid #{Process.ppid}"

    puts 'To see how the parent process is referenced on the terminal, open another tab and type:'
    puts "ps #{Process.ppid}"

    puts ''
    puts 'Note: Ruby\'s Process.ppid maps to getppid(2).'
  end
end
