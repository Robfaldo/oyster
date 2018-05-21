require "oystercard"

describe Oystercard do

  context "#balance" do

    it "should respond to the message 'balance'" do
      expect(subject.balance).to eq 0
    end

  end

end