require './lib/cracker'

RSpec.describe Cracker do
  before :each do
    @cracker = Cracker.new("vjqtbeaweqihssi", "291018")
  end

    it "is an instance of a cracker" do
      expect(@cracker).to be_a Cracker
    end

  end
