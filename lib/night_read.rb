require "./lib/night_writer"
# require "./lib/in_out"
require 'pry'



class NightRead


  attr_accessor :file_chars_array, :line_1, :line_2, :line_3

  def initialize(dummy_data = nil)
    @dummy_data = dummy_data
    @file_chars_array = []
    @line_1 = []
    @line_2 = []
    @line_3 = []
    @characters = []
  end

  def split_lines
    @line_1 = @file_chars_array[0]
    @line_2 = @file_chars_array[1]
    @line_3 = @file_chars_array[2]
    #take @file_chars_array and split it into 3 arrays
  end

  def form_braille_set_six
  #   @set_six = []
  #   #take the 1st two elements of each line -- INDEX AS VARIABLE -- then create a set_six array whic will iterate over 6 (2x3) input elements at once.
  end

  def translate_to_braille
  #   # start a comparison.
  #   # start with  [0] and compare to shift key-values.
  #     # if [0] matches shift, compare (set_twelve[x,y].flatten) to the capitals and insert the matching alphanumeric into the write_to_file method (via @character).
  #     # else compare [0] to the whole dictionary and insert the matching set_six into the write_to_file
  #   #Rinse and repeat
  end

  def characters
  #   @characters
  #   #holds translated characters as an array
  #   @characters.flatten.to_s
  end


end
