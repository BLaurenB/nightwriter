require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille.rb'

class BrailleTest < Minitest::Test

  def test_Braille_exists
    braille = Braille.new
    assert_instance_of Braille, braille
  end

  def test_it_can_read_in_files
    braille = Braille.new
    assert_equal ["....\n", "..00\n", "..0.\n"] ,  braille.read_in_file
  end


  def test_it_splits_array_line_1
    braille = Braille.new
    braille.read_in_file
    assert_equal ["....\n"], braille.split_lines.line_1
  end

  # def test___
  #   braille = Braille.new
  #   assert_____ expected outcome, expected input
  # end

  # def test___
  #   braille = Braille.new
  #   assert_____ expected outcome, expected input
  # end

  # def test___
  #   braille = Braille.new
  #   assert_____ expected outcome, expected input
  # end

  # def test___
  #   braille = Braille.new
  #   assert_____ expected outcome, expected input
  # end

  # def test___
  #   braille = Braille.new
  #   assert_____ expected outcome, expected input
  # end

end
