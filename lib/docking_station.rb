require_relative 'bike'

class DockingStation

  def release_bike
    fail "no bike" unless @bike
    @bike
  end

  def dock(bike)
    fail "full!" if @bike
    @bike = bike
  end

  attr_reader :bike
end
