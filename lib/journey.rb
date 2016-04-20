class Journey
  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  attr_reader :entry_station, :list_of_journeys, :journey_complete

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @list_of_journeys = []
    @journey_complete = false
  end

  def start(entry_station)
    @entry_station = entry_station
  end

  def finish(exit_station)
    @list_of_journeys << {entry_station => exit_station}
    @journey_complete = exit_station.nil? || entry_station.nil? ? false : true
    fare
  end

  def fare
    @entry_station = nil
    return PENALTY_FARE unless journey_complete?
    MINIMUM_FARE
  end

  def journey_complete?
    journey_complete
  end

end