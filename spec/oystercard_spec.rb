load "oystercard.rb"

describe Oystercard do

let(:entry_station) { double :entry_station }
let(:exit_station) { double :exit_station }

  context "balance" do

		it "shows the balance" do
	  expect(subject.balance).to eq 0
		end

	  it "tops up the balance" do
	    expect{ subject.top_up Oystercard::MINIMUM_BALANCE }.to change{ subject.balance }.by Oystercard::MINIMUM_BALANCE
	  end

	  it 'cannot top up above the balance limit' do
	    balance_limit = Oystercard::BALANCE_LIMIT
	    subject.top_up(balance_limit)
	    expect { subject.top_up 1}.to raise_error "Your balance cannot exceed £#{balance_limit}"
	  end

  end


describe "Touching in and out" do

  context "Card has enough money" do

    before do
      subject.top_up(Oystercard::MINIMUM_BALANCE)
    end

    it "touches card in" do
      subject.touch_in(entry_station)
      expect(subject).to be_in_journey
    end

    it "stores the station where they touched in" do
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq entry_station
    end

    it "stores the station where they touched out" do
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.exit_station).to eq exit_station
    end

    it "touches card out" do
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject).not_to be_in_journey
    end

    it "forgets station on touch out" do
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.entry_station).to be_nil
    end

		it "confirms user is journey" do
			expect(subject).not_to be_in_journey
		end

  end

  context "No money on the card" do

    it "Does not allow travel below minimum balance" do
      expect {subject.touch_in(entry_station)}.to raise_error "You do not have the minimum balance for travel"
    end
	end
end

  context "Journey" do

    before do
      subject.top_up(Oystercard::MINIMUM_BALANCE)
    end

    it "Checks that the journey list is empty before travelling" do
      expect(subject.list_of_journeys).to be_empty
    end

    it "is a hash consisting of entry and exit stations" do
      journey = Hash.new
      journey[entry_station] = exit_station
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.list_of_journeys).to include journey
    end

end
end

