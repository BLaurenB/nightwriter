require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille.rb'

class BrailleTest < Minitest::Test

  def test_braille_exists
    braille = Braille.new
    assert_instance_of Braille, braille
  end

  def test_it_reads_in_a_file
    braille = Braille.new
    assert_equal ["....\n", "..00\n", "..0.\n"], braille.read_in_file
  end

  def test_it_splits_array_line_1
    braille = Braille.new
    braille.read_in_file
    braille.split_lines
    assert_equal "....\n", braille.line_1
  end

  def test_it_converts_to_text
    braille = Braille.new(["....", "..00", "..0."])
    assert_equal " !", braille.convert_to_text
  end

  def test_it_converts_to_text_again
    braille = Braille.new(['000..0.0', '....0000', '0...0.0.', '0...0.0.'])
    assert_equal "matt", braille.convert_to_text

  end

end
