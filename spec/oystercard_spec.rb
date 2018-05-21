require "oystercard"

describe Oystercard do

  context "#balance and top up" do

    it "should be initialised with balance of 0" do
      expect(subject.balance).to eq 0
    end

    it '#top_up - add money to balance' do
      expect { subject.top_up 10 }.to change { subject.balance }.by 10
    end

  end

end