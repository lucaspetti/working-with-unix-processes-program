# frozen_string_literal: true

CHAPTERS = Dir.entries('./chapters/').select! { |f| /\d/.match f }
CHAPTERS.each { |file| require_relative "../chapters/#{file}" }
require_relative 'printer'

class Router
  include Printer

  def execute(skip_menu = nil)
    return help_menu if ARGV.include?('--help')

    skip_menu ? print_chapters : print_index
    input = get_input
    map_input.keys.include?(input.to_i) ? map_input[input.to_i].call : wrong_input(input)
  end

  def map_input
    {
      3 => proc { ProcessID.new(Process).execute },
      4 => proc { ProcessParents.new(Process).execute },
      5 => proc { FileDescriptor.new.execute },
      6 => proc { ResourceLimits.new.execute },
      7 => proc { ProcessEnvironment.new.execute },
      8 => proc { ProcessArguments.new.execute },
      9 => proc { ProcessNames.new.execute },
      10 => proc { still_developing },
      11 => proc { still_developing },
      12 => proc { still_developing },
      13 => proc { still_developing },
      14 => proc { still_developing },
      15 => proc { still_developing },
      16 => proc { still_developing },
      17 => proc { still_developing },
      18 => proc { still_developing },
      19 => proc { still_developing }
    }
  end

  def get_input
    STDIN.gets
  end

  def chapter_names
    CHAPTERS.sort.map { |name| name.split('.').first }
  end

  def wrong_input(input)
    abort "Could not understand #{input}"
  end

  def exit_chapter
    puts 'Type 1 to exit or anything else to go back to index'
    input = get_input
    input.to_i == 1 ? exit : execute(:skip_menu)
  end
end

Router.new.execute
