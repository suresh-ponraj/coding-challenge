require_relative "file_process.rb"

# This is the starting point of the application.
# First we read the file sent in the commandline.
filename = ARGV[0]
if filename == nil
  puts "Please input filename."
  exit(false)
end
reader = File.open(ARGV[0])

# send the fiile to the read method to load the contents of the file into array
# of hashes.
names = FileProcess.read(reader)

# sort and write the names to a new file.
sorted = FileProcess.sort(names)
filename = "output.txt"
FileProcess.write(sorted, filename)
puts "Names have been sorted."