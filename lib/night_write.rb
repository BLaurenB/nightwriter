#This version is not up to date

class NightWrite

  attr_reader :top, :middle, :bottom

  def initialize
    @top = []
    @middle = []
    @bottom = []
  end

  def check_capitals(character)
    if character == character.downcase
    #checks if character is lowercase
    elsif character == character.upcase
    #checks if character is a capital letter
      @top << Dictionary.engilish_to_braille['shift'][0]
      @middle << Dictionary.engilish_to_braille['shift'][1]
      @bottom << Dictionary.engilish_to_braille['shift'][2]
      character = character.downcase
    end
    character_translation(character)
  end

  def character_translation(character)
    braille_or_empty = Dictionary.engilish_to_braille[character] || []
    #checks if the character is a key if not passes an empty array
    braille_or_empty.each_with_index.map do |braille, index|
    #looks at the vaule associated to the character key and it's index
    #depending on the index the value will be stored in an empty array
      if index == 0
        @top << braille
      elsif index == 1
        @middle << braille
      elsif index == 2
        @bottom << braille
      end
    end
  end

  def word_translation(word)
    word.split("").each { |character| check_capitals(character)}
    #passes characters one at a time to check_capitals
    line_1 = @top.join("")
    line_2 = @middle.join("")
    line_3 = @bottom.join("")
    #reset the array's to empty for next word
    @top = []
    @middle = []
    @bottom = []
    #creates one string from each array
    line_1.concat("\n").concat(line_2).concat("\n").concat(line_3)
  end

end
