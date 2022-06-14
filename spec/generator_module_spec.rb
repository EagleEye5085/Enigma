require './lib/generator_module'
require './lib/encryptor'

RSpec.describe GeneratorModule do
  before :each do
    @encryptor = Encryptor.new(message = nil, key = ("01234"), date = ("090588"))
  end

  it "can generate a letter array with a spece" do
    expect(@encryptor.letter_array_generator).to eq ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
  end

  it "can generate a 5 digit key" do
    @encryptor.key_generator
    expect(@encryptor.key).not_to eq "01234"
  end

  it "can generate a date" do
    @encryptor.date_generator
    expect(@encryptor.date).not_to eq "090588"
  end

  it "can generate keys" do
    expect(@encryptor.keys_generator).to eq ({:a_key=>1, :b_key=>12, :c_key=>23, :d_key=>34})
  end

  it "can generate offsets" do
    expect(@encryptor.offset_generator).to eq ({:a_offset=>6, :b_offset=>19, :c_offset=>27, :d_offset=>38})
  end

end
