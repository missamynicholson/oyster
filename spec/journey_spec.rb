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
    expect(journey.finish(station)).to eq Journey::MINIMUM_FARE
  end

  context "Card has enough money" do

      it "confirms user is not in journey at start" do
        expect(journey).not_to be_in_journey
      end

      it "starts journey" do
        journey.start(station)
        expect(journey).to be_in_journey
      end

      it "ends journey" do
        journey.start(station)
        journey.finish(station)
        expect(journey).not_to be_in_journey
      end

      it "forgets entry station when journey ends" do
        journey.start(station)
        journey.finish(station)
        expect(journey.entry_station).to be_nil
      end

      it "raises an error if didn't touch in" do
        expect(journey.finish(station)).to eq 1
      end

      it "raises an error if didn't touch out" do
        expect(journey.finish(nil)).to eq 1
      end

      it "returns journey not complete" do
        expect(journey).not_to be_journey_complete
      end

      it "returns journey is complete" do
        journey.start(station)
        journey.finish(station)
        expect(journey).to be_journey_complete
      end

    end

end