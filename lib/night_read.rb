require "./lib/dictionary"
require "./lib/runner"


class NightRead


  attr_accessor :file_chars_array, :characters, :line_1, :line_2, :line_3, :set_six

  def initialize
    @x = 0
    @y = 1

  end

  def accept_file_chars_array_from_runner_class
    runner = Runner.new
    @file_chars_array = runner.read_in_file
  end

  def split_lines
    @line_1 = @file_chars_array[0]
    @line_2 = @file_chars_array[1]
    @line_3 = @file_chars_array[2]
  end

  def form_braille_set_six #tests green
    @set_six = [@line_1[@x..@y], @line_2[@x..@y], @line_3[@x..@y]]
  end

  def translate_to_english_character #green
    @characters = []
      while @x <= @line_1.length
      if @set_six == ['..', '..', '.0']
        @x += 2
        @y += 2
        form_braille_set_six
        @characters << Dictionary.braille_to_english[@set_six].upcase
        #skips from the shift character and the alpha character to the next un-checked braille set_six.
      else
        form_braille_set_six
        @characters << Dictionary.braille_to_english[@set_six]
      end
      @x += 2
      @y += 2
    end
  end


  def flatten_english_characters_to_string
    @characters.join("")
  end

  def wrap_characters
    print_chars = []
    while @characters.length > 0
      print_chars << @characters.slice!(0..79)
    end
    print_chars.join("\n")
  end


end


if __FILE__ == $PROGRAM_NAME
  night_read = NightRead.new
  runner = Runner.new
  night_read.accept_file_chars_array_from_runner_class
  night_read.split_lines
  night_read.form_braille_set_six
  night_read.translate_to_english_character
  night_read.flatten_english_characters_to_string
  night_read.wrap_characters

  puts runner.count_output_chars
end
