require "./lib/dictionary"
require "./lib/runner"


class NightRead


  attr_accessor :file_chars_array, :characters, :line_1, :line_2, :line_3, :set_six

  def initialize
    @file_chars_array = []
    @line_1 = []
    @line_2 = []
    @line_3 = []
    @characters = []
    @set_six = []
    @x = 0
    @y = 1
    @runner = Runner.new #needed? or do we push this from the Translate class?
  end

  def accept_file_chars_array_from_runner_class
    @file_chars_array = @runner.file_chars_array
    #should be in a multi-array form. We might need to update this to account for braille that breaks to new lines.
  end

  def split_lines #tests green
    @line_1 = @file_chars_array[0]
    @line_2 = @file_chars_array[1]
    @line_3 = @file_chars_array[2]
    #take @file_chars_array and split it into 3 arrays
  end

  def form_braille_set_six #tests green
    @set_six = [@line_1[@x..@y], @line_2[@x..@y], @line_3[@x..@y]]
  end

  def translate_to_english_character #green
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


  def flattern_english_characters_to_string
    @characters.join("").flatten.to_s
  end

  def wrap_characters
    print_chars = ""
    while @characters.length != nil
      print_chars.concat(@characters.slice!(0..79))
    end
  end


end
