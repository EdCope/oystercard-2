class Journey

  attr_reader :entry_station, :fare
  attr_accessor :exit_station

  MIN_FARE = 1
  PENALTY_FARE = 6 

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def fare
    return PENALTY_FARE if @entry_station == nil || @exit_station == nil
    return MIN_FARE
  end

  def finish(entry_station, exit_station, fare)
    @entry_station = entry_station
    @exit_station = exit_station
    @fare = fare
    self
  end

  def complete?
    return true if @entry_station != nil && @exit_station != nil
    false
  end
end