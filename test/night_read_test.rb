require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_read'
require './lib/runner'
require './lib/dictionary'

class NightReadTest < Minitest::Test

  def test_night_read_exists
    night_read = NightRead.new
    assert_instance_of NightRead, night_read
  end


  def test_it_splits_array_line_1
    night_read = NightRead.new
    night_read.file_chars_array = ["....\n", "..00\n", "..0.\n"]
    night_read.split_lines

    assert_equal  "....\n", night_read.line_1
  end

  def test_it_splits_array_line_2
    night_read = NightRead.new
    night_read.file_chars_array = ["....\n", "..00\n", "..0.\n"]
    night_read.split_lines

    assert_equal  "..00\n", night_read.line_2
  end

#
  def test_it_splits_array_line_3
    night_read = NightRead.new
    night_read.file_chars_array = ["....\n", "..00\n", "..0.\n"]
    night_read.split_lines

    assert_equal  "..0.\n", night_read.line_3
  end


  def test_it_forms_a_set_six
    night_read = NightRead.new
    night_read.file_chars_array = ["....\n", "..00\n", "..0.\n"]
    night_read.split_lines
    night_read.form_braille_set_six

    assert_equal ["..", "..", ".."], night_read.set_six
  end

  def test_it_translates_to_upper_case_chars
    night_read = NightRead.new
    night_read.file_chars_array = ["..0.0.0.0.0.\n", "..00.00.0..0\n", ".0....0.0.0."]
    night_read.split_lines
    night_read.form_braille_set_six
    night_read.translate_to_english_character

    assert_equal "H", night_read.characters[0]
  end

  def test_it_translates_to_upper_case_chars
    night_read = NightRead.new
    night_read.file_chars_array = ["0.0.0.0.0.\n", "00.00.0..0\n", "....0.0.0."]
    night_read.split_lines
    night_read.form_braille_set_six
    night_read.translate_to_english_character

    assert_equal "h", night_read.characters[0]
  end


  # def test_case_name
  #   night_read = NightRead.new
  #
  #   input/actual =
  #   output/expected =
  #
  #   assert... expected, actual
  # end

  # def test_case_name
  #   night_read = NightRead.new
  #
  #   input/actual =
  #   output/expected =
  #
  #   assert... expected, actual
  # end



end
