require_relative "file_process.rb"

describe "sort_names" do

  describe "read" do

    it "reads the file and creates a hash" do

      reader = File.open("spec_input.txt")
      names = FileProcess.read(reader)

      expect(names.length).to eq 2
      expect(names[0][:last_name]).to eq "Bar"
      expect(names[0][:first_name]).to eq "Foo"
      expect(names[1][:last_name]).to eq "Bar"
      expect(names[1][:first_name]).to eq "Baz"
    end

  end

  describe "sort" do

    it "order the name by last name followed by first name" do

      names = [
        {
          last_name: "A",
          first_name: "C"
        },
        {
          last_name: "A",
          first_name: "A"
        },
        {
          last_name: "A",
          first_name: "B"
        }
      ]

      sorted = FileProcess.sort(names)

      expect(sorted[0][:last_name]).to eq "A"
      expect(sorted[0][:first_name]).to eq "A"
      expect(sorted[1][:last_name]).to eq "A"
      expect(sorted[1][:first_name]).to eq "B"
      expect(sorted[2][:last_name]).to eq "A"
      expect(sorted[2][:first_name]).to eq "C"
    end
  end

  describe "write" do

    it "creates a file and writes the names" do

      names = [
        {
          last_name: "A",
          first_name: "C"
        },
        {
          last_name: "A",
          first_name: "A"
        }
      ]

      filename = "spec_output.txt"
      FileProcess.write(names, filename)

      reader = File.read(filename)
      expect(reader[0..2].to_s).to eq "A,C"
      expect(reader[4..6].to_s).to eq "A,A"
    end
  end

end