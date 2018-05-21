class Oystercard
  attr_reader :balance
  DEFAULT_MAXIMUM_BALANCE = 90

  def initialize(max_balance = DEFAULT_MAXIMUM_BALANCE)
    @balance = 0
    @max_balance = max_balance
  end

  def top_up(amount) 
    raise "limit exceeds maximum allowed balance of £#{@max_balance}" if @balance + amount > @max_balance
    @balance += amount
  end

  def deduct(amount) 
    @balance -= amount
  end

  def max_limit
    "Max limit is £#{@max_balance}"
  end

end