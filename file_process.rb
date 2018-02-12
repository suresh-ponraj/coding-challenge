# FileProcess holds method to read the names in the file and orders those names.
class FileProcess
  def self.sort(input_file, output_file)
    names = []
    input_file.each do |line|
      name = line.split(',')
      names.push(last_name: name[0], first_name: name[1])
    end

    names.sort_by! { |name| [name[:last_name], name[:first_name]] }

    names.each do |name|
      output_file.write(name.values_at(:last_name, :first_name).join(','))
    end
  end
end
