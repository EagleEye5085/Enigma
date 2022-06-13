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

  it " can encrypt a message without a date" do
    expect(@enigma.encrypt("hello world", "02715")).not_to eq({encryption: "keder ohulw", key: "02715", date: "040895"})
  end

  it " can encrypt a message without a date or a key" do
    expect(@enigma.encrypt("hello world")).not_to eq({encryption: "keder ohulw", key: "02715", date: "040895"})
  end

  it "can decrypt a message" do
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq({decryption: "hello world", key: "02715", date: "040895"})
  end

  it "can decrypt a message without a date" do
    expect(@enigma.decrypt("keder ohulw", "02715")).not_to eq({decryption: "hello world", key: "02715", date: "040895"})
  end

  it "can crack a message without a key" do
    expect(@enigma.crack("vjqtbeaweqihssi", "291018")).to eq({decryption: "hello world end", date: "291018", key: "08304"})
  end


end
