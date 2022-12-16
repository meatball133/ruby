require 'minitest/autorun'
require_relative 'locomotive_engineer'

class LocomotiveEngineerTest < Minitest::Test
  def test_minimal_first_interest_rate
    assert_equal 0.5, LocomotiveEngineer.get_list_of_wagons(1,5,2,7,4), [1,5,2,7,4]
  end
end

