require "./lib/dictionary"
require "./lib/runner"


class NightRead


  attr_accessor :file_collection, :characters, :line_1, :line_2, :line_3, :set_six, :runner

  def initialize
    @x = 0
    @y = 1
    @runner = Runner.new
  end

  def accept_file_collection_from_runner_class
    @file_collection = @runner.read_in_file
  end

  def split_lines
    @line_1 = @file_collection[0].strip
    @line_2 = @file_collection[1].strip
    @line_3 = @file_collection[2].strip
  end

  def form_braille_set_six #tests green
      @set_six = [@line_1[@x..@y], @line_2[@x..@y], @line_3[@x..@y]]
  end

  def translate_to_english_character #green

    @characters = []
    while @y < @line_1.length
      form_braille_set_six
      if @set_six != nil
        if @set_six == ["..", "..", ".0"]
          @x += 2
          @y += 2
          form_braille_set_six
          english_character = Dictionary.braille_to_english[@set_six]
          if @set_six == nil || english_character == nil
            break
          end
          @characters << english_character.upcase
        elsif @set_six == ["..", "..", ".."]
          @characters << "*"
        else
          @characters << Dictionary.braille_to_english[@set_six]
        end
      else
        @characters << ""
      end
      @x += 2
      @y += 2
    end
  end

  def written_translation
    print_chars = []
    # require 'pry'; binding.pry
    while @characters.length > 0
      print_chars << @characters.slice!(0..79)
    end

    @runner.write_to_file(print_chars.flatten.join("").tr("*", " "))
    puts @runner.count_output_chars
  end

end


if __FILE__ == $PROGRAM_NAME
  night_read = NightRead.new
  file_contents = night_read.accept_file_collection_from_runner_class
  night_read.split_lines
  # set_six = night_read.form_braille_set_six
  night_read.translate_to_english_character
  night_read.written_translation
end
