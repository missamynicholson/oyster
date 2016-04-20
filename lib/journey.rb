class Journey

  attr_reader :entry_station, :list_of_journeys

  def initialize
    @entry_station = nil
    @list_of_journeys = []
  end

  def start(entry_station)
    @entry_station = entry_station
  end

  def finish(exit_station)
    calculate(exit_station)
  end

  def in_journey?
    !!entry_station
  end

  def calculate(exit_station)
    fail "You haven't touched in" if entry_station.nil?
    hash = {}
    hash[entry_station] = exit_station
    @entry_station = nil
    @list_of_journeys << hash
    zone_calculate(list_of_journeys)
  end

  def zone_calculate(list_of_journeys)
    20
  end

  def journey_complete?
    @list_of_journeys.last
  end

end