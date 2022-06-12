require './lib/enigma'


RSpec.describe Enigma do
  before :each do
    @enigma = Enigma.new
  end

  it "is an instance of a enigma" do
    expect(@enigma).to be_a Enigma
  end

  it " can encrypt a message" do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq({encryption: "keder ohulw", key: "02715", date: "040895"})
  end

  it "can decrypt a message" do
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq({decryption: "hello world", key: "02715", date: "040895"})
  end


end
