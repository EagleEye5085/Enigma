require './lib/encryptor'

RSpec.describe Encryptor do
  before :each do
    @encryptor = Encryptor.new("hello world", "02715", "040895")
  end

  it "is an instance of an encryptor" do
    expect(@encryptor).to be_a Encryptor
  end

  it "can generate keys" do
    @encryptor.key_generator
    expect(@encryptor.keys).to eq({:a_key=>2, :b_key=>27, :c_key=>71, :d_key=>15})
  end 

  it "can encrypt a message" do
    # require 'pry'; binding.pry
    expect(@encryptor.encrypt).to eq({encryption: "keder ohulw", key: "02715", date: "040895"})
  end
end
