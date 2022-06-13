require './lib/encryptor'

RSpec.describe Encryptor do
  before :each do
    @encryptor = Encryptor.new("hello world", "02715", "040895")
  end

  it "is an instance of an encryptor" do
    expect(@encryptor).to be_a Encryptor
  end

  it "has a message" do
    expect(@encryptor.message).to eq "hello world"
  end

  it "has a key" do
    expect(@encryptor.key).to eq "02715"
  end

  it "has a date" do
    expect(@encryptor.date).to eq "040895"
  end

  it "can encrypt a message" do
    expect(@encryptor.encrypt).to eq({encryption: "keder ohulw", key: "02715", date: "040895"})
  end
end
