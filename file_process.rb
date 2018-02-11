class FileProcess

  # This method reads the given file line by line, splits the name into last
  # name and first name and then creates an array of hashes.
  def self.read(file)
    
    names = []
    file.each do |line|

      name = line.split(",")
      names.push({
        last_name: name[0],
        first_name: name[1] != nil ? name[1].split[0] : nil
      })
    end

    return names
  end

  # Sort methods takes the array of hashes as input and sorts the hashes based
  # on last name first and then first name.
  def self.sort(names)
 
    # sort_by method is used to carry out the sorting operation.
    sorted = names.sort_by{ |name| [name[:last_name], name[:first_name]] }
    return sorted
  end

  # write method will write the sorted names into a new file.
  def self.write(names, filename)

    file = File.open(filename, 'w')
    
    names.each do |name|
        file.write(name[:last_name].to_s + "," + name[:first_name].to_s + "\n")
    end

    file.close
  end
    
end