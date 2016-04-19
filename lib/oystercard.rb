class Oystercard

BALANCE_LIMIT = 90
attr_reader :balance

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

end