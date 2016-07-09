require 'docking_station'

describe DockingStation do

  it 'allows user to set a capacity when instantiating new DStation' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    it 'raises an error if we try to dock when already at capacity' do
      described_class::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
      expect{subject.dock(Bike.new)}.to raise_error("Sorry, all full up!")
    end
  end

  describe '#release_bike' do
    it 'releases working bikes' do
      bike = double(:bike, broken?: false)
      subject.dock(bike)
      expect(subject.release_bike).to be bike
    end
    it 'raises an error when there are no bikes available' do
      expect{subject.release_bike}.to raise_error("No bikes!")
    end
    it 'raises an error when we try to release a broken bike' do
      # The following two lines of code can be shorthanded to:
      # bike = double(:bike, :broken?: true)
      bike = double(:bike)
      allow(bike).to receive(:broken?).and_return(true)
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error("Nope. This bike is broken.")
    end
  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument }
    it 'docks something' do
      # This test still passes after we replace Bike.new with double(:bike)
      # as we are not calling any methods on the bike class.
    	bike = double(:bike)
      expect(subject.dock(bike)).to include bike
    end
    it 'raises an error when we try to dock when full' do
      subject.capacity.times {subject.dock(double(:bike))}
      expect{subject.dock(double(:bike))}.to raise_error("Sorry, all full up!")
    end
  end

end
