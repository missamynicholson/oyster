require 'journey'
require 'oystercard'

describe Journey do

context "completed journeys" do

  let(:journey){ {entry_station => exit_station} }

    before do
      subject.top_up(Oystercard::MINIMUM_BALANCE)
    end

    it "Checks that the journey list is empty before travelling" do
      expect(subject.list_of_journeys).to be_empty
    end

    it "is a hash consisting of entry and exit stations" do
      oystercard_topped.touch_out(exit_station)
      expect(oystercard_topped.list_of_journeys).to include journey
    end

end

end