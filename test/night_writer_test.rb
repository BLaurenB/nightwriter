require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'

class NightWriterTest < Minitest::Test

  def test_night_writer_exists
    translator = NightWriter.new

    assert_instance_of NightWriter, translator
  end

  def test_print_character_with_letters
    #test three different letters in three instance of the NightWriter class
    translator1 = NightWriter.new
    translator1.print_character('c')

    assert_equal '00', translator1.top[0]
    assert_equal '..', translator1.middle[0]
    assert_equal '..', translator1.bottom[0]

    translator2 = NightWriter.new
    translator2.print_character('r')

    assert_equal '0.', translator2.top[0]
    assert_equal '00', translator2.middle[0]
    assert_equal '0.', translator2.bottom[0]

    translator3 = NightWriter.new
    translator3.print_character('y')

    assert_equal '00', translator3.top[0]
    assert_equal '.0', translator3.middle[0]
    assert_equal '00', translator3.bottom[0]
  end


  def test_print_words_returns_translation_in_braille
    translator = NightWriter.new
    braille1 = "000..0\n....00\n....0."
    braille2 = "000.00\n.0.000\n..0..."
    braille3 = "0..00.00\n0.0.00.0\n....0..."

    assert_equal braille1, translator.print_words('cat')
    assert_equal braille2, translator.print_words('dog')
    assert_equal braille3, translator.print_words('bird')

  end


end
