CHAPTERS = Dir.entries('./chapters/').select! { |f| /\d/.match f }
CHAPTERS.each { |file| require_relative file }

class Index
  def self.map_input
    {
      03 => Proc.new { processes_have_ids },
      04 => Proc.new { puts 'Still developing...' }
    }
  end

  def self.get_input
    STDIN.gets
  end

  def self.chapter_names
    CHAPTERS.sort.map { |name| name.split('.').first }
  end

  def self.wrong_input(input)
    abort "Could not understand #{input}"
  end

  def self.separator
    puts '----------------------------------------'
  end

  def self.print_index
    puts 'Welcome to the Working With Unix Processes Program.'
    separator
    puts "For your information, this process in running with pid #{Process.pid} and is called #{$PROGRAM_NAME}"
    separator
    puts 'Chapters:'
    chapter_names.each { |c| puts c }
    puts 'Enter the desired chapter number:'
    input = get_input
    map_input.keys.include?(input.to_i) ? map_input[input.to_i].call : wrong_input(input)
  end
end

Index.print_index
