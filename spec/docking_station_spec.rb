require 'docking_station'

describe DockingStation do
   it 'responds to request to release a bike' do
     expect(subject).to respond_to(:release_bike)
    end
   it 'gets a working bike' do
   	 expect(subject).to respond_to (:Bike)
   end
end
