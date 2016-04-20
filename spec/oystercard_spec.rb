load "oystercard.rb"

describe Oystercard do
let(:journey) { double :journey }
let(:entry_station) { double :entry_station }
let(:exit_station) { double :exit_station }
let(:oystercard_topped) do
    oystercard = Oystercard.new
    oystercard.top_up(Oystercard::MINIMUM_BALANCE)
    oystercard.touch_in(entry_station)
    oystercard
  end

  context "balance" do

		it "shows the balanceas zero with initialized" do
	   expect(subject.balance).to eq 0
		end

	  it 'cannot top up above the balance limit' do
	    balance_limit = Oystercard::BALANCE_LIMIT
	    subject.top_up(balance_limit)
	    expect { subject.top_up 1}.to raise_error "Your balance cannot exceed £#{balance_limit}"
	  end

  end


describe "Touching in and out" do

  context "Card has enough money" do

    it "confirms user is not in journey" do
      expect(subject).not_to be_in_journey
    end

    it "touches card in" do
      expect(oystercard_topped).to be_in_journey
    end

    it "touches card out" do
      oystercard_topped.touch_out(exit_station)
      expect(oystercard_topped).not_to be_in_journey
    end

    it "forgets station on touch out" do
      oystercard_topped.touch_out(exit_station)
      expect(oystercard_topped.entry_station).to be_nil
    end

  end

  context "No money on the card" do

    it "Does not allow travel below minimum balance" do
      expect {subject.touch_in(entry_station)}.to raise_error "You do not have the minimum balance for travel"
    end
	end
end

#   context "completed journeys" do

#   let(:journey){ {entry_station => exit_station} }

#     before do
#       subject.top_up(Oystercard::MINIMUM_BALANCE)
#     end

#     it "Checks that the journey list is empty before travelling" do
#       expect(subject.list_of_journeys).to be_empty
#     end

#     it "is a hash consisting of entry and exit stations" do
#       oystercard_topped.touch_out(exit_station)
#       expect(oystercard_topped.list_of_journeys).to include journey
#     end

# end

  context "Journey" do

    it 'instruct journey to start' do
      expect(:journey).to receive(:start)
      subject.touch_in(station)
    end




end

