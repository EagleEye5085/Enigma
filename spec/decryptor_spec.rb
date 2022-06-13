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

    it "can decrypt a message" do
      expect(@decryptor.decrypt).to eq({decryption: "hello world", key: "02715", date: "040895"})
    end

  end
