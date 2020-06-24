class SharedMemory < ChapterBase
  def initialize
    @title = 'Chapter 13: Processes Are Friendly'
    @data = [1, 2, 3]
  end

  def print_content
    puts 'The child process will be an exact copy of the parent process, including what is in memory'
    puts ''
    puts 'Modern Unix systems use copy-on-write semantics (CoW)'
    puts 'This means that it delays copying. A parent and a child will share the same data in memory until one of them needs to modify it.'

    puts 'Creating child process with only shared data...'
    create_fork
    sleep 1
    puts 'Creating child process that will copy the data...'
    create_fork { @data << 4 }
    sleep 1
    puts 'NOTE: programs need to manage memory properly in order to work with CoW. It is not the case of MRI and RBX'
  end

  def print_child_content
    puts @data
  end
end
