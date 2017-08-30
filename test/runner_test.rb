require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/runner.rb'

class Runner < Minitest::Test

  def test_runner_exists
    runner = Runner.new
    assert_instance_of Runner, runner
  end

end
