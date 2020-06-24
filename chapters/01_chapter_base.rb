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
end
