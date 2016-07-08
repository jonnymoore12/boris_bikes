require 'docking_station'

describe DockingStation do

  it 'allows user to set a capacity when instantiating new DStation' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
      expect{subject.dock(Bike.new)}.to raise_error("Sorry, full!")
    end
  end

=begin
  describe 'initialization' do
    it 'has a variable capacity, with default value if not spec dur instantiation' do
      docking_station = DockingStation.new(100)
      100.times { docking_station.dock(Bike.new) }
      # Not "subject.dock" as we are not general. We are testing that specific
      # docking_station that we just instantiated above.
      expect{docking_station.dock(Bike.new)}.to raise_error("Sorry, full!")
    end
  end
=end

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect{subject.release_bike}.to raise_error("No bikes!")
    end
  end

  describe '#dock' do
    it 'docks something' do
    	bike = Bike.new
      expect(subject.dock(bike)).to include bike
    end
    it 'raises an error when full' do
      # Syntax to access DEFAULT_CAPACITY from the DockingStation class
      subject.capacity.times {subject.dock(Bike.new)}
      expect{subject.dock(Bike.new)}.to raise_error("Sorry, full!")
    end
  end

end

=begin
      it 'releases working bikes' do
        bike = subject.release_bike
        expect(bike).to be_working
      end
=end
