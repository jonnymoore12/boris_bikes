require 'docking_station'

describe DockingStation do
    describe '#release_bike' do
      it 'raises an error when there are no bikes available' do
        # we want to release the bike we docked
        expect{subject.release_bike}.to raise_error("no bike")
      end
    end

    describe '#dock' do
      it 'returns docked bike' do
      	bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq bike
      end
      it 'raises an error if capacity is full' do
        bike = Bike.new
        subject.dock(bike)
        expect{subject.dock(Bike.new)}.to raise_error("full!")
      end
    end

=begin
      it 'releases working bikes' do
        bike = subject.release_bike
        expect(bike).to be_working
      end
=end
end
