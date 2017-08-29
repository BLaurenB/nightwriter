
class NightWrite

  attr_reader :top, :middle, :bottom

  def initialize
    @top = []
    @middle = []
    @bottom = []
  end

  def check_capitals(character)
    if character == character.upcase
    #checks if character is a capital letter
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
    line_1.concat("\n").concat(line_2).concat("\n").concat(line_3)
  end

  def word_translation(word)
    word.split("").each { |character| check_capitals(character) }
    write_braille
  end

end
