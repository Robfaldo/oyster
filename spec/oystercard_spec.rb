require "oystercard"

describe Oystercard do

  context "#balance and top up" do

    let(:max_balance) { Oystercard::DEFAULT_MAXIMUM_BALANCE }

    it "should be initialised with balance of 0" do
      expect(subject.balance).to eq 0
    end

    it '#top_up - adds money to balance' do
      expect { subject.top_up 10 }.to change { subject.balance }.by 10
    end

    context "top up" do

      before do
        subject.top_up(Oystercard::DEFAULT_MAXIMUM_BALANCE)
      end

      it "#top_up - raises an error if balance exceeds max limit" do
        expect { subject.top_up(10) }.to raise_error "limit exceeds maximum allowed balance of £#{max_balance}"
      end

      it '#deduct - removes money from balance' do
        expect { subject.deduct 10 }.to change { subject.balance }.by -10
      end

      it "#max_limit - has a max limit" do
        expect(subject.max_limit).to eq "Max limit is £#{max_balance}"
      end
    end

  end

  context "touch-in and out" do

    it "updates in_journey? to true once touched in" do
      subject.touch_in
      expect(subject.in_journey?).to be true
    end

    it "is not in journey when instantiated" do
      expect(subject).not_to be_in_journey
    end

    it "updates in_journey? to false once touched out" do
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey?).to be false
    end

    # it "allows you to touch in" do
    #   expect(subject.touch_in).to be true
    # end

    # it "allows you to touch out" do
    #   expect(subject.touch_out).to be false
    # end

    # it "can't be touched in and out at the same time" do
    #   subject.touch_in
    #   expect(subject.touched_in).to be true
    # end

  end

end