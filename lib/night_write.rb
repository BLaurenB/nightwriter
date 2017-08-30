require './lib/dictionary'
require './lib/runner'

class NightWrite

  attr_reader :top, :middle, :bottom

  def initialize
    @top = []
    @middle = []
    @bottom = []
    @runner = Runner.new
  end

  def read_in_file
    @runner.read_in_file.flatten.join("")
  end

  def check_capitals(character)
    if character == character.upcase
      @top << Dictionary.engilish_to_braille['shift'][0]
      @middle << Dictionary.engilish_to_braille['shift'][1]
      @bottom << Dictionary.engilish_to_braille['shift'][2]
      character = character.downcase
    end
    character_translation(character)
  end

  def create_braille_by_index(braille, index)
    if index == 0
      @top << braille
    elsif index == 1
      @middle << braille
    elsif index == 2
      @bottom << braille
    end
  end

  def character_translation(character)
    braille_or_empty = Dictionary.engilish_to_braille[character] || []
    braille_or_empty.each_with_index.map do |braille, index|
      create_braille_by_index(braille, index)
    end
  end

  def reset_lines
    @top = []
    @middle = []
    @bottom = []
  end

  def write_braille
    line_1 = @top.join("")
    line_2 = @middle.join("")
    line_3 = @bottom.join("")
    reset_lines
    slice_lines(line_1, line_2, line_3)
  end

  def word_translation(word)
    word.split("").each { |character| check_capitals(character) }
    write_braille
  end

  def slice_lines(line_1, line_2, line_3)
    main_string =[]
    while line_1.length > 0
      line_1_slice = line_1.slice!(0..79)
      line_2_slice = line_2.slice!(0..79)
      line_3_slice = line_3.slice!(0..79)
      main_string << line_1_slice.concat("\n").concat(line_2_slice).concat("\n").concat(line_3_slice)
    end
    @runner.write_to_file(main_string.join("\n"))
  end

end



if __FILE__ == $PROGRAM_NAME
  night_write = NightWrite.new
  word = night_write.read_in_file
  night_write.word_translation(word)
  runner = Runner.new
  runner.count_output_chars
end
