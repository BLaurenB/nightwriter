


require 'pry'

# my_array = IO.readlines('filename.txt')

class InOut

  def read_in_file
    @file_chars_array = IO.readlines("./lib/test_text_file.txt")
    # this returns 2 (2 lines that are separated into 2 array elements)

  end


  def write_to_file #this works
    File.open("./lib/Output.txt", "w") do |file|
      file.write(@file_chars_array << "This is a new line of text.") #this also works by sending an array of 3 elements (3 lines) to the text file_chars_array

    end
  end

  def count_output_chars
    @count_output_chars = IO.readlines("./lib/Output.txt")
    @count_output_chars = @count_output_chars.flatten
    @count_output_chars = @count_output_chars[0].split("").length
    #this takes the array made up of 1 line of text per element, flattens the elements into 1, splits it up to count it, and converts it to a string so it can be interpolated.
    "Created 'Output.txt' containing  #{@count_output_chars}  characters"

  end




end

# inout = InOut.new
# # binding.pry
# inout.read_in_file
# inout.write_to_file
