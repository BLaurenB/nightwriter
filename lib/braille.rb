require "./lib/night_writer"
require "./lib/in_out_no_argv"
require 'pry'



class Braille

  attr_accessor :@file_chars_array, :line_1, :line_2, :line_3

  def initialize
    @file_chars_array = []
    @line_1 = []
    @line_2 = []
    @line_3 = []
    @characters = []
  end

  def read_in_file
    @file_chars_array = IO.readlines("./lib/test_text_file.txt")
    # this returns each line of text in an array where each line is its own element
  end

  def split_lines
    @line_1 = @file_chars_array[0]
    @line_2 = @file_chars_array[1]
    @line_3 = @file_chars_array[2]
    #take @file_chars_array and split it into 3 arrays
  end

  def form_braille_set_twelve
    @set_twelve = []
    # EX: @line_1[0,1] + @line_2[0,1] + @line_3[0,1] but where [0,1] is more like [x,y] and after a loop, the index becomes [x+2, y+2]
    #take the 1st two elements of each line -- INDEX AS VARIABLE -- then create a variable called set_twelve which will be able to iterate over 12 (4x3) input elements at once
  end

  def form_braille_set_six
    @set_six = []
    #take the 1st two elements of each line -- INDEX AS VARIABLE -- then create a set_six array whic will iterate over 6 (2x3) input elements at once.
  end

  def capitals
    @capitals = []
    #make a method that computes the capital for each letter using the shift key and letter key.
  end

  def counter
    #doesn't have to be called this, but we might need something to help track what has been parsed. If so, it would count the number of parsed sets and begin the next translation cycle at the index this counter returns.
  end

  def translate_to_braille
    # start a comparison.
    # start with  [0] and compare to shift key-values.
      # if [0] matches shift, compare (set_twelve[x,y].flatten) to the capitals and insert the matching alphanumeric into the write_to_file method (via @character).
      # else compare [0] to the whole dictionary and insert the matching set_six into the write_to_file
    #Rinse and repeat
  end

  def characters
    @characters
    #holds translated characters as an array
    @characters.flatten.to_s 
  end


  def write_to_file #this works
    File.open("./lib/Output.txt", "w") do |f|
    #this opens a file to write to it.
      f.write("#{characters}")
      #this adds another line as an array element.
    end
  end

  def count_output_chars
    @count_output_chars = IO.readlines("./lib/Output.txt")
    @count_output_chars = @count_output_chars.flatten
    @count_output_chars = @count_output_chars[0].split("").length
    #this takes the array made up of 1 line of text per element, flattens the elements into 1, splits it up to count the characters
    "Created 'Output.txt' containing  #{@count_output_chars}  characters"
  end


  def characters
    @characters = {
    'a' => ['0.', '..', '..'],
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
  end

end

#Make sure to comment this out if running via pry
# inout = InOut.new
# puts inout.count_output_chars
