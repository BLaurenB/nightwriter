#FIXED! This one does work! 0827-0630



require 'pry'

# my_array = IO.readlines('filename.txt')

class InOut

    attr_accessor :@file_chars_array

    def initialize
      @file_chars_array = []

    end

  def read_in_file
    @file_chars_array = IO.readlines("./lib/test_text_file.txt")
    # this returns each line of text in an array where each line is its own element
  end


  def write_to_file #this works
    File.open("./lib/Output.txt", "w") do |f|
    #this opens a file to write to it.
      f.write(@file_chars_array << "This is a new line of text.")
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

end

#Make sure to comment this out if running via pry
# inout = InOut.new
# puts inout.count_output_chars
