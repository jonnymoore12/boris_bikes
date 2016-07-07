require 'docking_station'
#require 'bike'


describe DockingStation do

#it 'station release_bike' do
#   expect(Docking_station).to respond_to(:release_bike)
  it {is_expected.to respond_to :release_bike}
#it 'station release_bike' do
it 'release working bikes' do
  bike = subject.release_bike
  expect(bike).to be_working
end
  # expecting DockingStation instances to respond to .dock
 #it {is_expected.to respond_to(:dock).with(1).argument }
  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  #it {is_expected.to respond_to(:bike) }
  it 'return docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end
end
