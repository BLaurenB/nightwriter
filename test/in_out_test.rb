require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/in_out.rb'

class InOut < Minitest::Test

  def test_InOut_exists
    inout = InOut.new
    assert_instance_of InOut, inout
  end

end
