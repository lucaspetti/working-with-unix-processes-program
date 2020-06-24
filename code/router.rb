# frozen_string_literal: true

CHAPTERS = Dir.glob('chapters/*.rb').map { |f| f.delete_prefix('chapters/') }
CHAPTERS.each { |file| require_relative "../chapters/#{file}" }
require_relative 'printer'

class Router
  include Printer

  def execute(skip_menu = nil)
    return help_menu if ARGV.include?('--help')

    skip_menu ? print_chapters : print_index
    input = get_input
    map_input.keys.include?(input.to_i) ? execute_chapter(input) : wrong_input(input)
  end

  def map_input
    {
      3 => 'ProcessID',
      4 => 'ProcessParents',
      5 => 'FileDescriptor',
      6 => 'ResourceLimits',
      7 => 'ProcessEnvironment',
      8 => 'ProcessArguments',
      9 => 'ProcessNames',
      10 => 'ProcessExitCodes',
      11 => 'ProcessForks',
      12 => 'OrphanedProcesses',
      13 => 'SharedMemory',
      14 => 'ProcessWait',
      15 => 'ZombieProcesses',
      16 => 'ProcessSignals',
      17 => 'ProcessCommunicate',
      18 => 'DaemonProcesses',
      19 => 'TerminalProcesses'
    }
  end

  def get_input
    STDIN.gets
  end

  def chapter_names
    CHAPTERS.sort.map { |name| name.chomp('.rb') }
  end

  def wrong_input(input)
    abort "Could not understand #{input}"
  end

  def execute_chapter(input)
    Object.const_get(map_input[input.to_i]).new.execute
  end

  def exit_chapter
    puts 'Type 1 to exit or anything else to go back to index'
    input = get_input
    input.to_i == 1 ? exit : execute(:skip_menu)
  end
end

Router.new.execute
