require 'docking_station'

describe DockingStation do

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    # Do we want this:?
    it {is_expected.to respond_to :release_bike}
    it 'raises an error if there are no bikes' do
      expect { subject.release_bike }.to raise_error("No bikes!")
    end
  end

  it 'is working' do
    bike = Bike.new
    expect(bike).to be_working
  end

  # Bit confused by this test here. Dock currently returns an array.
  describe '#dock' do
    it 'docks something' do
      bike = Bike.new
      # So we turned "bike" into "[bike]"
      expect(subject.dock(bike)).to eq [bike]
    end
    # This one also fails. It's expecting a bike to be returned by .dock(),
    # but .dock() returns the whole array
    it 'return docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq bike
    end

    it 'raises an error when full' do
      20.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error("Cannot accept bike - Full")
    end
  end

end

=begin
Should we also have this:
it 'release working bikes' do
  bike = subject.release_bike
  expect(bike).to be_working
end
=end
