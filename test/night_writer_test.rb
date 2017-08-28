require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'

class NightWriterTest < Minitest::Test

  def test_night_writer_exists
    translator = NightWriter.new

    assert_instance_of NightWriter, translator
  end

  def test_character_translation_with_letters
    #test three lowercase letters
    translator1 = NightWriter.new
    translator1.character_translation('c')

    assert_equal '00', translator1.top[0]
    assert_equal '..', translator1.middle[0]
    assert_equal '..', translator1.bottom[0]

    translator2 = NightWriter.new
    translator2.character_translation('r')

    assert_equal '0.', translator2.top[0]
    assert_equal '00', translator2.middle[0]
    assert_equal '0.', translator2.bottom[0]

    translator3 = NightWriter.new
    translator3.character_translation('y')

    assert_equal '00', translator3.top[0]
    assert_equal '.0', translator3.middle[0]
    assert_equal '00', translator3.bottom[0]
  end

  def test_character_translation_with_special_characters
    #test three special characters
    translator1 = NightWriter.new
    translator1.character_translation('!')

    assert_equal '..', translator1.top[0]
    assert_equal '00', translator1.middle[0]
    assert_equal '0.', translator1.bottom[0]

    translator2 = NightWriter.new
    translator2.character_translation("'")

    assert_equal '..', translator2.top[0]
    assert_equal '..', translator2.middle[0]
    assert_equal '0.', translator2.bottom[0]

    translator3 =NightWriter.new
    translator3.character_translation(".")

    assert_equal '..', translator3.top[0]
    assert_equal '00', translator3.middle[0]
    assert_equal '.0', translator3.bottom[0]

  ### translator4 = NightWriter.new
  ### translator4.character_translation("*")

  ### assert_nil translator4.top[0]
  end

  def test_check_capitals_with_capitals
    #test three capital letters
    translator1 = NightWriter.new
    translator1.check_capitals('C')

    assert_equal ['..', '00'], translator1.top
    assert_equal ['..', '..'], translator1.middle
    assert_equal ['.0', '..'], translator1.bottom

    translator2 = NightWriter.new
    translator2.check_capitals('R')

    assert_equal ['..', '0.'], translator2.top
    assert_equal ['..', '00'], translator2.middle
    assert_equal ['.0', '0.'], translator2.bottom

    translator3 = NightWriter.new
    translator3.check_capitals('Y')

    assert_equal ['..', '00'], translator3.top
    assert_equal ['..', '.0'], translator3.middle
    assert_equal ['.0', '00'], translator3.bottom
  end

  def test_word_translation_with_lowercase
    translator = NightWriter.new
    braille1 = "000..0\n....00\n....0."
    braille2 = "000.00\n.0.000\n..0..."
    braille3 = "0..00.00\n0.0.00.0\n....0..."

    assert_equal braille1, translator.word_translation('cat')
    assert_equal braille2, translator.word_translation('dog')
    assert_equal braille3, translator.word_translation('bird')
  end

  def test_word_translation_with_captitals
    translator = NightWriter.new
    braille1 = "..000..0\n......00\n.0....0."
    braille2 = "..000.00\n...0.000\n.0..0..."
    braille3 = "..0..00.00\n..0.0.00.0\n.0....0..."

    assert_equal braille1, translator.word_translation('Cat')
    assert_equal braille2, translator.word_translation('Dog')
    assert_equal braille3, translator.word_translation('Bird')
  end

end
