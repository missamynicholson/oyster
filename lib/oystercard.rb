class Oystercard

BALANCE_LIMIT = 90
MINIMUM_BALANCE = 1
attr_reader :balance, :entry_station, :list_of_journeys

	def initialize
		@balance = 0
    @list_of_journeys = []
	end


  def top_up(amount)
    fail "Your balance cannot exceed £#{BALANCE_LIMIT}" if (amount + @balance) > BALANCE_LIMIT
    @balance += amount
  end

  def touch_in(entry_station)
  	fail "You do not have the minimum balance for travel" if @balance < MINIMUM_BALANCE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_BALANCE)
    journey(exit_station)
    @entry_station = nil
  end

  def in_journey?
  	!!@entry_station
  end

  def journey(exit_station)
    journey = {}
    journey[entry_station] = exit_station
    @list_of_journeys << journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end