require_relative 'journey'
class Oystercard

  BALANCE_LIMIT = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :journey

	def initialize(journey = Journey.new)
		@balance = 0
    @journey = journey
	end


  def top_up(amount)
    fail "Your balance cannot exceed £#{BALANCE_LIMIT}" if (amount + balance) > BALANCE_LIMIT
    @balance += amount
  end

  def touch_in(entry_station)
  	fail "You do not have the minimum balance for travel" if @balance < MINIMUM_FARE
    journey.start(entry_station)
  end

  def touch_out(exit_station)
    deduct(journey.finish(exit_station))
  end

  def in_journey?
    journey.in_journey?
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end