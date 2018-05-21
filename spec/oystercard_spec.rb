require "oystercard"

describe Oystercard do

  context "#balance and top up" do

    let(:max_balance) { Oystercard::DEFAULT_MAXIMUM_BALANCE }

    it "should be initialised with balance of 0" do
      expect(subject.balance).to eq 0
    end

    it '#top_up - add money to balance' do
      expect { subject.top_up 10 }.to change { subject.balance }.by 10
    end

    it "#max_limit - has a max limit" do
      expect(subject.max_limit).to eq "Max limit is £#{max_balance}"
    end

    it "#top_up - raises an error if balance exceeds max limit" do
      expect { subject.top_up(max_balance + 10) }.to raise_error "limit exceeds maximum allowed balance of £#{max_balance}"
    end

  end

end