class Van

  def initialize
    @van_bikes = []
  end

  attr_reader :van_bikes


  def take_from_ds(d_s)
    d_s.rack.each { |bike| @van_bikes << d_s.rack.delete(bike) if !(bike.working?) }
  end

  def deposit_bikes_to_garage(garage)
    @van_bikes.each { |bike| garage.bikes << @van_bikes.delete(bike) }
  end

  def collect_bikes_from_garage(garage)
    garage.bikes.each { |bike| @van_bikes << garage.bikes.delete(bike) }
  end

  def deposit_bikes_to_ds(docking_station)
    @van_bikes.each { |bike| docking_station.bikes << @van_bikes.delete(bike) }
  end

end
