require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_read.rb'
require './lib/in_out.rb'
#require './lib/dictionary.rb'

class NightReadTest < Minitest::Test

  def test_night_read_exists
    night_read = NightRead.new
    assert_instance_of NightRead, night_read
  end
  #
  # def test_it_reads_in_a_file
  #   night_read = NightRead.new
  #   assert_equal ["....\n", "..00\n", "..0.\n"], night_read.read_in_file
  # end

  def test_it_splits_array_line_1
    night_read = NightRead.new
    Inout.read_in_file
    night_read.split_lines
    assert_equal "....\n", night_read.line_1
  end

  def test_case_name

  end



end
