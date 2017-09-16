require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/apartment'

class ApartmentTest < Minitest::Test

  def test_intance_of_apartment_exists
    a1 = Apartment.new({number: 1, monthly_rent: 800, bathrooms: 1, bedrooms: 1})
    assert_instance_of Apartment, a1
  end

  def test_that_number_returns_the_value
    a1 = Apartment.new({number: 1, monthly_rent: 800, bathrooms: 1, bedrooms: 1})

    assert_equal 1, a1.number
    assert_equal 800, a1.monthly_rent
    assert_equal 1, a1.bathrooms
    assert_equal 1, a1.bedrooms
  end

  def test_that_unit_starts_out_with_no_renters
    a1 = Apartment.new({number: 1, monthly_rent: 800, bathrooms: 1, bedrooms: 1})
    assert_nil a1.renter
  end

  def test_that_add_renter_returns_and_instance_of_renter
    a1 = Apartment.new({number: 1, monthly_rent: 800, bathrooms: 1, bedrooms: 1})
    joe = Renter.new("Joe")

    a1.add_renter(joe)

    assert_instance_of Renter, a1.renter
    assert_equal joe, a1.renter
  end

end
