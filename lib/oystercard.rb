class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :trip_history
  CARD_LIMIT = 90
  MINIMUM_FARE = 1
  def initialize(balance= 0)
    @balance = balance
    @trip_history = []
    @journey = Journey.new
  end

  def top_up(amount)
    @balance += amount
    raise 'Maximum balance reached' if @balance > CARD_LIMIT
    @balance
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(station)
    fail "Balance below minimum." if @balance < MINIMUM_FARE
    @journey.start_journey(station)
    "Touched in successfully"
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @journey.end_journey(station)
    store_stations

    "Touched out successfully"
  end

   def store_stations
      @trip_history << @journey.current_journey
   end

private
  def deduct(charge)
    @balance -= charge
  end
end
