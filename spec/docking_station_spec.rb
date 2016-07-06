require 'docking_station'

describe DockingStation do
<<<<<<< HEAD
   it 'responds to request to release a bike' do
     expect(subject).to respond_to(:release_bike)
   end
end
=======
  it { is_expected.to respond_to :release_bike }
end

>>>>>>> 4765c3208c70ce4032d86eb62ff6e2385b7e997f
