class Journey
  MINIMUM_FARE = 1
  attr_reader :entry_station, :list_of_journeys, :journey_complete

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @list_of_journeys = []
    @journey_complete = nil
  end

  def start(entry_station)
    @entry_station = entry_station
  end

  def finish(exit_station)
    fare(exit_station)
  end

  def in_journey?
    !!entry_station
  end

  def fare(exit_station)
    6 if entry_station.nil? || exit_station.nil?
    @entry_station = nil
    @list_of_journeys << {entry_station => exit_station}
    @journey_complete = true
    MINIMUM_FARE
  end

  def journey_complete?
    @journey_complete
  end

end