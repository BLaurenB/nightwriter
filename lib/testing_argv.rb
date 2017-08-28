class TestArgv

  def initialize()
    @argv = ARGV
  end

  def print_ARGV_elements
    puts "ARGV[0] = #{@argv[0]}, ARGV[1] = #{@argv[1]}, ARGV[2] = #{@argv[2]}"
  end

end


#ruby ./lib/testing_argv.rb braille.txt original_message.txt
#ARGV[0] = braille.txt
#ARGV[1] = original_message.txt
#ARGV[2] = nil if using the example above

test_argv = TestArgv.new
test_argv.print_ARGV_elements
