require 'journey_log'

describe JourneyLog do
  let(:entry_station)   { double(:entry_station, name: "Old Street", zone: 1) }
  let(:exit_station )   { double(:exit_station, name: "Bond Street", zone: 2) }
  subject(:journeylog)  {  described_class.new  }
  let(:journey) { {{entry_station: entry_station} => {exit_station: exit_station}} }

  it 'remembers journey history' do
    journeylog.start entry_station
    journeylog.finish exit_station
    expect(journeylog.journeys).to include journey
  end

  # describe '#complete' do
  #   # let(:journey) { {{entry_station: entry_station} => {exit_station: nil}} }
  #   it 'starts a journey' do
  #     expect(journey).to receive(:new)
  #   end
  # end

end