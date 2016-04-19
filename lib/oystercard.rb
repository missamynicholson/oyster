class Oystercard

BALANCE_LIMIT = 90
attr_reader :balance, :touched_in

	def initialize
		@balance = 0
	end


  def top_up(amount)
    fail "Your balance cannot exceed #{BALANCE_LIMIT}" if (amount + @balance) > BALANCE_LIMIT
    @balance += amount
  end

  def deduct(amount)
  	@balance -= amount
  end

  def touch_in
  	@touched_in = true
  end

  def touch_out
    @touched_in = false
  end

  def in_journey?
  	@touched_in
  end

end