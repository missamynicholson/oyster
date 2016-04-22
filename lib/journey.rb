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
    current_journey[:entry_station].nil? || current_journey[:exit_station].nil? ? false : true
  end

  def amount
    diff = (current_journey[:exit_station].zone - current_journey[:entry_station].zone).abs
    1 + diff
  end

end

