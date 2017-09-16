require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/building'
require './lib/apartment'

class BuildingTest < Minitest::Test

  def test_that_a_building_exists
    building = Building.new

    assert_instance_of Building, building
  end

  def test_that_units_returns_an_empty_array
    building = Building.new

    assert_equal [], building.units
  end

  def test_that_add_units_adds_and_apartment_to_unit
    building = Building.new
    a1 = Apartment.new({number: 1, monthly_rent: 650, bedroom: 1, bathroom: 1})

    building.add_unit(a1)

    assert_instance_of Apartment, building.units.first
    assert_equal 1 , building.units.count
  end

  def test_that_add_units_can_take_additional_apartments
    building = Building.new
    a1 = Apartment.new({number: 1, monthly_rent: 650, bedroom: 1, bathroom: 1})
    a2 = Apartment.new({number: 1, monthly_rent: 750, bedrooms: 0, bathrooms: 1})

    building.add_unit(a1)
    building.add_unit(a2)

    assert_equal 2 , building.units.count
  end

  def test_average_rent_returns_average
    building = Building.new
    a1 = Apartment.new({number: 1, monthly_rent: 650, bedroom: 1, bathroom: 1})
    a2 = Apartment.new({number: 1, monthly_rent: 750, bedrooms: 0, bathrooms: 1})

    building.add_unit(a1)
    building.add_unit(a2)

    assert_equal 700 , building.average_rent
  end

  def test_total_annual_rent_returns_every_unit
    building = Building.new
    a1 = Apartment.new({number: 1, monthly_rent: 650, bedroom: 1, bathroom: 1})
    a2 = Apartment.new({number: 1, monthly_rent: 750, bedrooms: 0, bathrooms: 1})

    building.add_unit(a1)
    building.add_unit(a2)

    assert_equal 16800, building.total_annual_rent
  end

  def test_building_occupancy_starts_at_0
    building = Building.new

    assert_equal 0.0, building.occupancy
  end

  def test_add_renter_changes_occupany_as_related_to_total_units
    building = Building.new
    a1 = Apartment.new({number: 1, monthly_rent: 650, bedroom: 1, bathroom: 1})
    a2 = Apartment.new({number: 1, monthly_rent: 750, bedrooms: 0, bathrooms: 1})
    building.add_unit(a1)
    building.add_unit(a2)

    joe = Renter.new("Joe")
    a1.add_renter(joe)

    assert_equal 50.0, building.occupancy
  end


end
