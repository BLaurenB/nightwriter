require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/in_out.rb'

class NightWriterTest < Minitest::Test

  def test_InOut_exists
    inout = InOut.new
    assert_instance_of InOut, inout
  end

  def it_it_can_read_in_files #Not sure how to reallt test this!
    inout= InOut.new
    ! assert_nil inout.read_in_file
  end



end
