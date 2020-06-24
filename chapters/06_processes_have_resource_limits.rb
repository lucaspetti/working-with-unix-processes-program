class ResourceLimits < ChapterBase
  def initialize
    @title = 'Chapter 6: Processes Have Resource Limits'
  end

  def print_content
    puts 'How many file descriptors can one process have?'
    puts ''
    puts "Limits for current process: #{Process.getrlimit(:NOFILE)}"
    puts ''
    puts 'The first element is the soft limit for the number of file descriptors, the second is the hard limit.'

    puts 'Now bumping the soft limit to 3000...'
    change_soft_limit(3000)

    puts "New limits for current process: #{Process.getrlimit(:NOFILE)}"
    puts ''
    puts 'NOTE: lowering the hard limit is irreversible'
    puts ''
    # EXAMPLE: To raise the soft limit to equal the hard limit: Process.setrlimit(:NOFILE, Process.getrlimit(:NOFILE)[1])
    separator
    puts 'Lowering the soft limit to 3 and exceeding...'
    puts ''
    change_soft_limit(3)
    sleep 1
    puts '- Exceding the limit raises the following error:'
    open_file('/dev/null')
  rescue Errno::EMFILE => e
    puts e.inspect
    separator
    puts 'Other resources:'

    puts "Maximum number of simultaneous processes allowed for current user: #{Process.getrlimit(:NPROC)}"
    puts "Largest file size that may be created: #{Process.getrlimit(:FSIZE)}"
    puts "Maximum size of the stack segment of the process: #{Process.getrlimit(:STACK)}"
    separator
    puts 'You can take a look at the documentation for Process.getrlimit for a full list'
  end

  def change_soft_limit(limit)
    Process.setrlimit(:NOFILE, limit)
  end
end
