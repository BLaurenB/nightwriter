require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/dictionary'

class DictionaryTest < Minitest::Test

  def test_english_to_braille_a
    expected = ['0.', '..', '..']
    actual = Dictionary.engilish_to_braille['a']

    assert_equal expected, actual
  end

  def test_english_to_braille_n
    expected = ['00', '.0', '0.']
    actual = Dictionary.engilish_to_braille['n']

    assert_equal expected, actual
  end

  def test_english_to_braille_z
    expected = ['0.', '.0', '00']
    actual = Dictionary.engilish_to_braille['z']

    assert_equal expected, actual
  end

  def test_english_to_braille_peirod
    expected = ['..', '00', '.0']
    actual = Dictionary.engilish_to_braille['.']

    assert_equal expected, actual
  end

  def test_english_to_braille_apostrophe
    expected = ['..', '..', '0.']
    actual = Dictionary.engilish_to_braille["'"]

    assert_equal expected, actual
  end

  def test_english_to_braille_space
    expected = ['..', '..', '..']
    actual = Dictionary.engilish_to_braille[' ']

    assert_equal expected, actual
  end

  def test_english_to_braille_1
    expected = ['0.', '..', '..']
    actual = Dictionary.engilish_to_braille['1']

    assert_equal expected, actual
  end

  def test_english_to_braille_4
    expected = ['00', '.0', '..']
    actual = Dictionary.engilish_to_braille['4']

    assert_equal expected, actual
  end

  def test_english_to_braille_9
    expected = ['.0', '0.', '..']
    actual = Dictionary.engilish_to_braille['9']

    assert_equal expected, actual
  end

  def test_english_to_braille_percentage
    actual = Dictionary.engilish_to_braille['%']

    assert_nil actual
  end

  def test_english_to_braille_astrick
    actual = Dictionary.engilish_to_braille['*']

    assert_nil actual
  end

  def test_english_to_braille_dollar_sign
    actual = Dictionary.engilish_to_braille['$']

    assert_nil actual
  end

end
