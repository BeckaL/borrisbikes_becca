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
      van.deposit_bikes_to_garage(garage)
      expect(van.van_bikes).to eq []

    end
  end

  describe '#collect_bikes_from_garage' do

    it 'loads van with working bikes from garage' do
      van = Van.new
      bike = double :bike, working?: true
      garage = double :garage, bikes: [bike]
      van.collect_bikes_from_garage(garage)
      expect(van.van_bikes).to eq [bike]
    end

  end

  describe '#deposit_bikes_to_ds' do
    it 'unloads the bikes from the van to the docking station' do
      van = Van.new
      bike = double :bike, working?: true
      van.van_bikes << bike
      docking_station = double :docking_station, bikes: []
      van.deposit_bikes_to_ds(docking_station)
      expect(van.van_bikes).to eq []
      expect(docking_station.bikes).to eq [bike]
    end
  end

end
