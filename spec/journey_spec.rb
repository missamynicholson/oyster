require 'journey'

describe Journey do
  subject(:journey){described_class.new(current_journey: journey_current)}

  let(:entry_station) { double(:entry_station, name: "Old Street", zone: 1) }
  let(:exit_station ) { double(:exit_station, name: "Bond Street", zone: 2) }
  let(:journey_current) { {entry_station: entry_station, exit_station: exit_station} }

  let(:journey2) {described_class.new(current_journey: journey_current2)}
  let(:journey3) {described_class.new(current_journey: journey_nil)}

  let(:journey_current2) { {entry_station: exit_station, exit_station: entry_station} }
  let(:journey_nil) { {entry_station: entry_station, exit_station: nil} }

  it 'takes off the minimum fare when zone 1 to 2'do
    expect(journey.fare).to eq Journey::MINIMUM_FARE + 1
  end

  it 'takes off the minimum fare when zone 2 to 1'do
    expect(journey2.fare).to eq Journey::MINIMUM_FARE + 1
  end

  it 'charges a penalty when haven\'t touched in or touched out' do
    expect(journey3.fare).to be Journey::PENALTY_FARE
  end
end