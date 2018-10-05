require 'van'

describe Van do

  describe '#take_from_ds' do

    it 'take broken bike from docking stations' do
      van = Van.new
      bike = double :bike, working?: true
      broken_bike = double :broken_bike, working?: false
      bike2 = double :bike2, working?: true
      bikes = [bike, broken_bike, bike2]
      docking_station = double :docking_station, rack: bikes
      van.take_from_ds(docking_station)
      expect(van.van_bikes).to eq [broken_bike]
    end

  end

  describe '#deposit_bikes_at_garage' do

    it 'van has no bikes after it deposits at garage' do
      van = Van.new
      bike = double :bike, working?: false
      van.van_bikes << bike
      garage = double :garage, bikes: []
      van.deposit(garage)
      expect(van.van_bikes).to eq []

    end

  end

end
