require './lib/generator_module'
require './lib/encryptor'


RSpec.describe GeneratorModule do
  before :each do
    @encryptor = Encryptor.new(message = nil, key = nil, date = nil)
  end

  it "can generate a 5 digit key" do
    @encryptor.key_generator
    expect(@encryptor.key.length).to eq 5
  end

end
