class OrphanedProcesses < ChapterBase
  def initialize
    @title = 'Chapter 12: Orphaned Processes'
  end

  def print_content
    puts 'When a parent process dies, the child does not exit necessarily.'
    puts 'Therefore, it is easy to create the so called "orphan" process'
    puts 'For further knowledge, read the whole chapter of the book, as no orphan process will be created here.'
  end
end
