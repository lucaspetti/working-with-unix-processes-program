require_relative '01_chapter_base'

class FileDescriptor < ChapterBase
  def initialize
    @title = 'Chapter 5: Processes Have File Descriptors'
    @passwd = open_file('/etc/passwd')
    @hosts = open_file('/etc/hosts')
  end

  def print_content
    puts 'Any time you open a resource in a running process it is assigned a file descriptor number'
    puts "After opening /etc/passwd, the fileno for it is #{@passwd.fileno}"
    puts "After opening /etc/hosts, the fileno for it is #{@hosts.fileno}"
    puts ''
    puts 'Now closing the open passwd file...'
    sleep 2
    @passwd.close
    puts 'Opening null...'
    null = open_file('/dev/null')
    sleep 1
    puts "The fileno for /dev/null is #{null.fileno}"
    separator
    puts 'NOTE: trying to read the fileno from a closed resource will raise the following error:'
    @passwd.fileno
  rescue IOError => e
    puts e.inspect

    sleep 1
    separator
    puts 'About Standard Streams:'
    puts 'Every UNIX process comes with three open resources: standard input (STDIN), standard output (STDOUT) and standard error (STDERR)'

    puts "Fileno for STDIN: #{STDIN.fileno}"
    puts "Fileno for STDOUT: #{STDOUT.fileno}"
    puts "Fileno for STDERR: #{STDERR.fileno}"
  end

  def open_file(path)
    File.open path
  end
end
