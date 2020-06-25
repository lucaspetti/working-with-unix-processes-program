# frozen_string_literal: true

module Printer
  def print_title(title)
    separator
    puts title
    separator
  end

  def separator
    puts '----------------------------------------'
  end

  def print_index
    puts 'Welcome to the Working With Unix Processes Program.'
    separator
    puts "For your information, this process in running with pid #{Process.pid} and is called #{$PROGRAM_NAME}"
    separator
    print_chapters
  end

  def print_chapters
    puts 'Chapters:'
    puts ''
    chapter_names.each { |c| puts c unless c == '01_chapter_base' }
    puts ''
    puts 'Enter the desired chapter number or anything else to quit the program'
    puts ''
  end

  def still_developing
    puts 'Still developing...'
  end

  def help_menu
    print_title('HELP MENU')
    puts 'There is currently no help menu, sorry.'
  end

  def loading_dots
    sleep 1
    print '.'
  end
end
