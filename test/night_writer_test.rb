require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'

class NightWriterTest < Minitest::Test

  def test_night_writer_exists
    translator = NightWriter.new

    assert_instance_of NightWriter, translator
  end

  def test_print_letter_returns_single_letter_in_braille
    translator = NightWriter.new
    braille1 = "0.\n..\n.."
    braille2 = "00\n..\n0."
    braille3 = "0.\n.0\n00"

    assert_equal braille1, translator.print_letter('a')
    assert_equal braille2, translator.print_letter('m')
    assert_equal braille3, translator.print_letter('z')
  end

  def test_print_letter_returns_single_special_character_in_braille
    translator = NightWriter.new
    braille1 = "..\n00\n0."
    braille2 = "..\n..\n0."
    braille3 = "..\n..\n00"

    assert_equal braille1, translator.print_letter('!')
    assert_equal braille2, translator.print_letter("'")
    assert_equal braille3, translator.print_letter('-')
  end

  def test_print_words_returns_translation_in_braille
    translator = NightWriter.new
    braille1 = "000..0\n....00\n....0."
    braille2 = "000.00\n.0.000..0..."
    braille3 = "0..00.00\n0.0.00.0\n....0..."

    assert_equal braille1, translator.print_words('cat')
    assert_equal braille2, translator.print_words('dog')
    assert_equal braille3, translator.print_words('bird')



  end

end
