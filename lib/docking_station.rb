require_relative 'bike'

class DockingStation
  attr_reader :capacity
  attr_reader :bikes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "No bikes!" if empty?
    fail "Nope. This bike is broken." if @bikes[-1].broken?
    bikes.pop
  end

  def dock(bike)
    fail "Sorry, all full up!" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
