require './lib/encryptor'

RSpec.describe Encryptor do
  before :each do
    @encryptor = Encryptor.new("hello world", "02715", "040895")
  end

  it "is an instance of an encryptor" do
    expect(@encryptor).to be_a Encryptor
  end

  it "can encrypt a message" do
    expect(@encryptor.encrypt).to eq({encryption: "keder ohulw", key: "02715", date: "040895"})
  end
end
