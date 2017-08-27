require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'

class NightWriterTest < Minitest::Test

  def test_it_exists
    inout = InOut.new
    assert_instance_of inout
  end 

end
