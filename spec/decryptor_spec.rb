require './lib/decryptor'

RSpec.describe Decryptor do
  before :each do
      @decryptor = Decryptor.new("keder ohulw", "02715", "040895")
    end

    it "is an instance of a decryptor" do
      expect(@decryptor).to be_a Decryptor
    end

    it "has a message" do
      expect(@decryptor.message).to eq "keder ohulw"
    end

    it "has a key" do
      expect(@decryptor.key).to eq "02715"
    end

    it "has a date" do
      expect(@decryptor.date).to eq "040895"
    end

    it "has a letter array" do
      expect(@encryptor.letter_array).to eq ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    end

  end
