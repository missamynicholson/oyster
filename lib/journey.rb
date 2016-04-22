require_relative 'station'

class Journey
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :current_journey

  def initialize(current_journey:)
    @current_journey = current_journey
  end

  def fare
    complete? ? amount : PENALTY_FARE
  end

  private

  def complete?
    @current_journey.keys[0].values[0].nil? || @current_journey.values[0].values[0].nil? ? false : true
  end

  def amount
    zone_entry = @current_journey.keys[0].values[0].zone
    zone_exit = @current_journey.values[0].values[0].zone
    diff = (zone_exit - zone_entry).abs
    1 + diff
  end

end

