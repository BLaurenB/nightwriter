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

  def print_letter(letter)
    #input one character
    @characters[letter].join "\n"
    #takes the letter key and returns the value array
    #joins with new line character
  end

  def print_character(letter)
    #require 'pry'; binding.pry
    @characters[letter].each_with_index do |braille, index|
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
    character = word.split("")
    character.each { |letter| print_character(letter)}
    line_1 = @top.join("")
    line_2 = @middle.join("")
    line_3 = @bottom.join("")
    line_1 + "\n" + line_2 + "\n" + line_3
  end

end
