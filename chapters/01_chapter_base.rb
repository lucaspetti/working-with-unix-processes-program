require_relative '../code/printer'

class ChapterBase
  include Printer

  def initialize
    @title = 'Chapter Title'
  end

  def execute
    print_title @title
    print_content

    separator
    Router.new.exit_chapter
  end

  private

  def print_content
    puts 'Still Developing...'
  end

  def open_file(path)
    File.open path
  end

  def create_fork
    fork do
      puts "-- Hello world from child process with pid #{Process.pid} --"
      at_exit do
        puts '-- Goodbye world from child process! --'
        separator
      end
    end
  end
end
