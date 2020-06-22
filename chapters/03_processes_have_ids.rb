def processes_have_ids
  puts separator
  puts 'Chapter 3: Processes Have IDs'

  puts "This process is running on pid #{Process.pid}"
  puts 'To see how the process is referenced on the terminal, open another tab and type:'
  puts "ps #{Process.pid}"

  puts 'Note: Ruby\'s Process.pid maps to getpid(2).'
  puts separator
  puts 'Type 1 to exit or anything else to go back to index'
  input = get_input

  input.to_i == 1 ? exit : print_index
end
