
require 'pry'

# my_array = IO.readlines('filename.txt')

class InOut

    def initialize
      @file_chars_array = []
    end

  def read_in_file
    @file_chars_array = IO.readlines("./data/test_text_file.txt")
    # this returns each line of text in an array where each line is its own element
    return
  end


  def write_to_file
    new_file = File.open("./data/Output.txt", "w") #this worked
    @file_chars_array << "This is a new line of text."
    new_file.write("#{@file_chars_array.to_s}")

  end

  def count_output_chars
    @count_output_chars = IO.readlines("./data/Output.txt") #returns an array
    @count_output_chars = @count_output_chars.flatten
    @count_output_chars = @count_output_chars[0].to_s.split("").length
    #this takes the array made up of 1 line of text per element, flattens the elements into 1, splits it up to count the characters
    "Created 'Output.txt' containing  #{@count_output_chars}  characters"
  end

end


inout = InOut.new
#puts inout.read_in_file
puts inout.write_to_file
puts inout.count_output_chars
