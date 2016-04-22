require_relative 'journey'

class JourneyLog

  attr_reader :current_journey

  def initialize
    @journeys = []
    @current_journey = {entry_station: nil, exit_station: nil}
  end

  def start(entry_station)
    @current_journey[:entry_station] = entry_station
  end

  def finish(exit_station)
    @current_journey[:exit_station] = exit_station
    complete_journey
  end

  def complete_journey
    journey = Journey.new(current_journey: current_journey)
    @journeys << journey
    return journey.fare
    @current_journey = {entry_station: nil, exit_station: nil}
  end

  def in_journey?
    !!current_journey[:entry_station]
  end

   def journeys
     @journeys.dup
   end

end






