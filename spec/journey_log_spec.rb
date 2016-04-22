require 'journey_log'

describe JourneyLog do
  subject(:journeylog) { described_class.new }
  let(:entry_station) { double(:entry_station, name: "Old Street", zone: 1) }
  let(:exit_station ) { double(:exit_station, name: "Bond Street", zone: 2) }
  let(:journey) { double(:journey, current_journey: {{entry_station: entry_station} => {exit_station: exit_station}}) }


  # it 'remembers journey history' do
  #   expect(journey).to receive(:new).and_return({{entry_station: entry_station} => {exit_station: exit_station}})
  #   journeylog.complete_journey
  # end
end