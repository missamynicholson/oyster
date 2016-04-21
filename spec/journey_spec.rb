require 'journey'

describe Journey do
  subject(:journey){described_class.new}
  let(:journey_current) { {{entry_station: entry_station} => {exit_station: exit_station}} }
  let(:journey_current2) { {{entry_station: exit_station} => {exit_station: entry_station}} }
  let(:journey_nil) { {{entry_station: entry_station} => {exit_station: nil}} }
  let(:entry_station)   { double(:entry_station, name: "Old Street", zone: 1) }
  let(:exit_station )   { double(:exit_station, name: "Bond Street", zone: 2) }

  it 'takes off the minimum fare'do
    expect(journey.fare(journey_current)).to eq Journey::MINIMUM_FARE + 1
  end

  it 'takes off the minimum fare'do
    expect(journey.fare(journey_current2)).to eq Journey::MINIMUM_FARE + 1
  end

  it 'charges a penalty' do
    expect(journey.fare(journey_nil)).to be Journey::PENALTY_FARE
  end
end