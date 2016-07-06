class DockingStation
  # init method?

  # Could have used def bike; @bike; end
  attr_reader :bike


  def release_bike

  end

  def dock(bike)
    @bike = bike
  end

end
