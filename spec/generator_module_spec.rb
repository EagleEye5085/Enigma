require './lib/generator_module'
require './lib/encryptor'


RSpec.describe GeneratorModule do
  before :each do
    @encryptor = Encryptor.new(message = nil, key = ("01234"), date = ("090588"))
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
    @encryptor.keys_generator
    expect(@encryptor.keys).to eq ({:a_key=>1, :b_key=>12, :c_key=>23, :d_key=>34})
  end

  it "can generate keys" do
    @encryptor.keys_generator
    @encryptor.offset_generator
    expect(@encryptor.offsets).to eq ({:a_offset=>6, :b_offset=>19, :c_offset=>27, :d_offset=>38})
  end

end
