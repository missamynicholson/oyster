require 'journey'
require 'oystercard'

describe Journey do
  subject(:journey) { described_class.new}
  let(:station) { double :station }

  it "starts a journey" do
    expect(journey.start(station)).to eq station
  end

  it "ends a journey" do
    journey.start(station)
    expect(journey.finish(station)).to eq 20
  end

  context "Card has enough money" do

      it "confirms user is not in journey" do
        expect(journey).not_to be_in_journey
      end

      it "touches card in" do
        journey.start(station)
        expect(journey).to be_in_journey
      end

      it "touches card out" do
        journey.start(station)
        journey.finish(station)
        expect(journey).not_to be_in_journey
      end

      it "forgets station on touch out" do
        journey.start(station)
        journey.finish(station)
        expect(journey.entry_station).to be_nil
      end

      it "raises an error if not touched in" do
        expect {journey.finish(station)}.to raise_error "You haven't touched in"
      end

    end


# context "completed journeys" do

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

end