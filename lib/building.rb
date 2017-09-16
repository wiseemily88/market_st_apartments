class Building
  attr_reader :units, :occupancy

  def initialize
    @units = []
  end

  def add_unit(apartment)
    @units << apartment
  end

  def average_rent
    total_rent/ units.count
  end

  def total_annual_rent
    total_rent * 12
  end

  def occupancy
    if units.empty?
      0.0
    else
      (number_of_occupied_units / units.count.to_f ) * 100
    end
  end

  private

  def number_of_occupied_units
    units.count do |apartment|
      apartment.renter != nil
    end
  end

  def total_rent
    units.reduce(0) do |sum, apartment|
      sum + apartment.monthly_rent
    end
  end

end
