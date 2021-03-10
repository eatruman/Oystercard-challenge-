class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :trip_history
  CARD_LIMIT = 90
  MINIMUM_FARE = 1
  def initialize(balance= 0)
    @balance = balance
    @entry_station = entry_station
    @exit_station = exit_station
    @trip_history = []
  end

  def top_up(amount)
    @balance += amount
    raise 'Maximum balance reached' if @balance > CARD_LIMIT
    @balance
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    fail "Balance below minimum." if @balance < MINIMUM_FARE
    @entry_station = station
    "Touched in successfully"
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @exit_station = station
    store_stations 
    @entry_station = nil
    "Touched out successfully"
  end

   def store_stations
     @trip_history << { entry_station: @entry_station, exit_station:  @exit_station}
   end

private
  def deduct(charge)
    @balance -= charge
  end
end
