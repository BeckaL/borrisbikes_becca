class Van
  
  def initialize
    @van_bikes = []
  end

  attr_reader :van_bikes


  def take_from_ds(d_s)
    d_s.rack.each { |bike| @van_bikes << d_s.rack.delete(bike) if !(bike.working?) }
  end

end
