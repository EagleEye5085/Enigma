require './lib/cracker'

RSpec.describe Cracker do
  before :each do
    @cracker = Cracker.new("vjqtbeaweqihssi", "291018")
  end

    it "is an instance of a cracker" do
      expect(@cracker).to be_a Cracker
    end

    it "has a message" do
      expect(@cracker.message).to eq "vjqtbeaweqihssi"
    end

    it "has a date" do
      expect(@cracker.date).to eq "291018"
    end

  end
