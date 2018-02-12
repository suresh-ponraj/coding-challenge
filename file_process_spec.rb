require_relative 'file_process.rb'

describe 'sort' do
  it 'order the name by last name followed by first name' do
    input = File.open('spec_input.txt')
    output = File.open('output.txt', 'w')

    FileProcess.sort(input, output)
    output.close

    expected = File.read('output.txt')
    expect(expected[0..6].to_s).to eq 'Bar,Baz'
    expect(expected[8..14].to_s).to eq 'Bar,Foo'
    expect(expected[16..22].to_s).to eq 'Foo,Bar'
  end
end
