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

  def open_file(path)
    File.open path
  end

  def create_fork
    fork do
      yield if block_given?
      print_child_content
      at_exit do
        puts '-- Goodbye world from child process! --'
        separator
      end
    end
  end
end
