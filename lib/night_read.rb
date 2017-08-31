require "./lib/dictionary"
require "./lib/runner"


class NightRead


  attr_reader :file_collection, :characters, :line_1, :line_2, :line_3, :set_six, :runner, :a, :b, :c, :x

  def initialize
    @x = 0
    @file_collection = []
    @line_1 = []
    @line_2 = []
    @line_3 = []
    @runner = Runner.new
    @a = 0
    @b = 1
    @c = 2
  end

  def accept_file_collection_from_runner_class
    @file_collection = @runner.read_in_file
  end

  def create_3_lines
    # require "pry"; binding.pry
    (file_collection.length).times do
      @line_1 << @file_collection[a].to_s.strip
      @line_2 << @file_collection[b].to_s.strip
      @line_3 << @file_collection[c].to_s.strip
      @a += 3
      @b += 3
      @c += 3
    end
  end

  def increment_lines_by_two
    create_3_lines
    @line_1 = (@line_1.join("")).scan(/../)
    @line_2 = (@line_2.join("")).scan(/../)
    @line_3 = (@line_3.join("")).scan(/../)
  end


  def form_braille_set_six
      @set_six = [line_1[x], line_2[x], line_3[x]]
  end

  def input_to_characters
    if set_six == ["..", "..", ".0"]
      @x += 1
      form_braille_set_six
      translate_uppercase
    elsif set_six == ["..", "..", ".."]
      @characters << "*"
    else
      @characters << Dictionary.braille_to_english[set_six]
    end
  end

  def translate_uppercase
    english_character = Dictionary.braille_to_english[set_six]
    if set_six == nil || english_character == nil
      @characters << ""
    else
      @characters << english_character.upcase
    end
  end

  def translate_to_english_character
    @characters = []
    while x < line_1.length
      form_braille_set_six
      input_to_characters
      @x += 1
    end
  end

  def written_translation
    print_chars = []
    while characters.length > 0
      print_chars << @characters.slice!(0..79)
    end
    @runner.write_to_file(print_chars.flatten.join("").tr("*", " "))
    puts @runner.count_output_chars
  end

end


if __FILE__ == $PROGRAM_NAME
  night_read = NightRead.new
  file_contents = night_read.accept_file_collection_from_runner_class
  night_read.increment_lines_by_two
  set_six = night_read.form_braille_set_six
  night_read.translate_to_english_character
  night_read.written_translation
end
