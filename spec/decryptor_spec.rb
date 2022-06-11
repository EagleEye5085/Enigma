require './lib/decryptor'

RSpec.describe Decryptor do
  before :each do
      @decryptor = Decryptor.new("keder ohulw", "02715", "040895")
    end

    it "is an instance of a decryptor" do
      expect(@decryptor).to be_a Decryptor
    end

  end
