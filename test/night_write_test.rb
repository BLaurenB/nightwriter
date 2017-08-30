require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_write'
require './lib/dictionary'

class NightWriteTest < Minitest::Test

  def test_night_writer_exists
    translator = NightWrite.new

    assert_instance_of NightWrite, translator
  end

  def test_character_translation_with_letter_c
    translator1 = NightWrite.new
    translator1.character_translation('c')

    assert_equal '00', translator1.top[0]
    assert_equal '..', translator1.middle[0]
    assert_equal '..', translator1.bottom[0]
  end

  def test_character_translation_with_letter_r
    translator2 = NightWrite.new
    translator2.character_translation('r')

    assert_equal '0.', translator2.top[0]
    assert_equal '00', translator2.middle[0]
    assert_equal '0.', translator2.bottom[0]
  end

  def test_character_translation_with_letter_y
    translator3 = NightWrite.new
    translator3.character_translation('y')

    assert_equal '00', translator3.top[0]
    assert_equal '.0', translator3.middle[0]
    assert_equal '00', translator3.bottom[0]
  end

  def test_character_translation_with_exclamation
    translator1 = NightWrite.new
    translator1.character_translation('!')

    assert_equal '..', translator1.top[0]
    assert_equal '00', translator1.middle[0]
    assert_equal '0.', translator1.bottom[0]
  end

  def test_character_translation_with_apostrophe
    translator2 = NightWrite.new
    translator2.character_translation("'")

    assert_equal '..', translator2.top[0]
    assert_equal '..', translator2.middle[0]
    assert_equal '0.', translator2.bottom[0]
  end

  def test_character_translation_with_period
    translator3 =NightWrite.new
    translator3.character_translation(".")

    assert_equal '..', translator3.top[0]
    assert_equal '00', translator3.middle[0]
    assert_equal '.0', translator3.bottom[0]
  end

  def test_character_translation_with_non_exisiting_translation
    translator4 = NightWrite.new
    translator4.character_translation("*")

    assert_nil translator4.top[0]
  end

  def test_check_capitals_with_capital_C
    translator1 = NightWrite.new
    translator1.check_capitals('C')

    assert_equal ['..', '00'], translator1.top
    assert_equal ['..', '..'], translator1.middle
    assert_equal ['.0', '..'], translator1.bottom
  end

  def test_check_capitals_with_capital_R
    translator2 = NightWrite.new
    translator2.check_capitals('R')

    assert_equal ['..', '0.'], translator2.top
    assert_equal ['..', '00'], translator2.middle
    assert_equal ['.0', '0.'], translator2.bottom
  end

  def test_check_capitals_with_capital_Y
    translator3 = NightWrite.new
    translator3.check_capitals('Y')

    assert_equal ['..', '00'], translator3.top
    assert_equal ['..', '.0'], translator3.middle
    assert_equal ['.0', '00'], translator3.bottom
  end

  def test_word_translation_with_lowercase_cat
    translator = NightWrite.new
    braille = "000..0\n....00\n....0."

    assert_equal braille, translator.word_translation('cat')
  end

  def test_word_translation_with_lowercase_dog
    translator = NightWrite.new
    braille = "000.00\n.0.000\n..0..."

    assert_equal braille, translator.word_translation('dog')
  end

  def test_word_translation_with_lowercase_bird
    translator = NightWrite.new
    braille = "0..00.00\n0.0.00.0\n....0..."

    assert_equal braille, translator.word_translation('bird')
  end

  def test_word_translation_with_captital_Cat
    translator = NightWrite.new
    braille = "..000..0\n......00\n.0....0."

    assert_equal braille, translator.word_translation('Cat')
  end

  def test_word_translation_with_captital_Dog
    translator = NightWrite.new
    braille = "..000.00\n...0.000\n.0..0..."

    assert_equal braille, translator.word_translation('Dog')
  end

  def test_word_translation_with_captital_Cat
    translator = NightWrite.new
    braille = "..0..00.00\n..0.0.00.0\n.0....0..."

    assert_equal braille, translator.word_translation('Bird')
  end

end
