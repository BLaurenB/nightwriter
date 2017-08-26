require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '.lib/night_writer'

class NightWriterTest < Minitest::Test

  def test_night_writer_exists
    translator = NightWriter.new

    assert_instance_of translator
  end

end
