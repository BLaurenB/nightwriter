class NightWriter

  attr_reader :characters, :top, :middle, :bottom

  def initialize
    @characters = {'a' => ['0.', '..', '..'],
    'b' => ['0.', '0.', '..'],
    'c' => ['00', '..', '..'],
    'd' => ['00', '.0', '..'],
    'e' => ['0.',' .0', '..'],
    'f' => ['00', '0.', '..'],
    'g' => ['00', '00', '..'],
    'h' => ['0.', '00', '..'],
    'i' => ['.0', '0.', '..'],
    'j' => ['.0', '00', '..'],
    'k' => ['0.', '..', '0.'],
    'l' => ['0.', '0.', '0.'],
    'm' => ['00', '..', '0.'],
    'n' => ['00', '.0', '0.'],
    'o' => ['0.', '.0', '0.'],
    'p' => ['00', '0.', '0.'],
    'q' => ['00', '00', '0.'],
    'r' => ['0.', '00', '0.'],
    's' => ['.0', '0.', '0.'],
    't' => ['.0', '00', '0.'],
    'u' => ['0.', '..', '00'],
    'v' => ['0.', '0.', '00'],
    'w' => ['.0', '00', '.0'],
    'x' => ['00', '..', '00'],
    'y' => ['00', '.0', '00'],
    'z' => ['0.', '.0', '00'],
    '!' => ['..', '00', '0.'],
    "'" => ['..', '..', '0.'],
    ',' => ['..', '0.', '..'],
    '-' => ['..', '..', '00'],
    '.' => ['..', '00', '.0'],
    '?' => ['..', '0.', '00'],
    'shift' => ['..', '..', '.0'],
    'number_shift' => ['.0', '.0', '00'],
    '0' => ['.0', '00', '..'],
    '1' => ['0.', '..', '..'],
    '2' => ['0.', '0.', '0.'],
    '3' => ['00', '..', '..'],
    '4' => ['00', '.0', '..'],
    '5' => ['0.', '.0', '..'],
    '6' => ['00', '0.', '..'],
    '7' => ['00', '00', '..'],
    '8' => ['0.', '00', '..'],
    '9' => ['.0', '0.', '..'],
    ' ' => ['..', '..', '..'] }
    @top = []
    @middle = []
    @bottom = []
  end

  def print_character(character)
    @characters[character].each_with_index do |braille, index|
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

  def print_words(word)
    single_characters = word.split("")
    #splits word into characters
    single_characters.each { |character| print_character(character)}
    #should be sending one character at a time to print_character method
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
