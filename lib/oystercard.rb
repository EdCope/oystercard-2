require_relative "journey"

class Oystercard
  attr_reader :balance, :list_of_journeys, :journey_in_progress

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
    # @entry_station = nil
    # @exit_station = nil
    @list_of_journeys = []
    @journey_in_progress = []
  end
 
  def top_up(value)
    fail 'Maximum balance of #{max_balance} exceeded' unless value + balance <= MAX_BALANCE
    @balance += value
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(station, journey = Journey)
    fail 'Card has less than minimum balance' unless balance >= MIN_BALANCE
    current_journey = journey.new(station, nil)
    @journey_in_progress << current_journey
    deduct(current_journey.fare)
    # @exit_station = nil
    # @entry_station = station
  end

  def touch_out(station, journey)
    journey.exit_station = station
    deduct(MIN_FARE)
    @exit_station = station
    # list_of_journeys << { @entry_station => @exit_station }
    #@journey[:entry_station] = @entry_station
    #@journey[:exit_station] = @exit_station
    list_of_journeys << Journey.new(@entry_station, @exit_station)
    @entry_station = nil
  end

  private

  def deduct(value)
    @balance -= value
  end
end
