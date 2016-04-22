require 'journey_log'

describe JourneyLog do
  subject(:journeylog) { described_class.new }
  let(:entry_station) { double(:entry_station, name: "Old Street", zone: 1) }
  let(:exit_station ) { double(:exit_station, name: "Bond Street", zone: 2) }
  let(:journey) { double(:journey, fare: nil) }


  it "initializes with incomplete journey" do
    expect(journeylog.in_journey?).to eq false
  end

  it "finish method increases journeys array by 1" do
    journeylog.start(entry_station)
    expect { journeylog.finish(exit_station) }.to change { journeylog.journeys.length }.by 1
  end

end