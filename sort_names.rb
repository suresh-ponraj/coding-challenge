require_relative 'file_process.rb'

# This is the starting point of the application.
# First we read the file sent in the commandline.
if ARGV[0].nil?
  puts 'Please input filename.'
  exit(false)
end

input_file = File.open(ARGV[0])
output_file = File.open('output.txt', 'w')
FileProcess.sort(input_file, output_file)
puts 'Names have been sorted.'
