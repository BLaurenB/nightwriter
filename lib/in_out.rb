


require 'pry'

# my_array = IO.readlines('filename.txt')

class InOut


  def initialize()
    @argv = ARGV
  end

  def print_ARGV_elements
    puts "ARGV[0] = #{@argv[0]}, ARGV[1] = #{@argv[1]}, ARGV[2] = #{@argv[2]}"
  end


  def read_in_file
    @file_chars_array = IO.readlines("./lib/#{@argv[0]}")
    # this returns 2 (2 lines that are separated into 2 array elements)
  end


  def write_to_file #this works
    File.open("./lib/#{@argv[1]}", "w") do |file|
      file.write(@file_chars_array << "This is a new line of text...08/27 11:45A") #this also works by sending an array of 3 elements (3 lines) to the text file_chars_array
    end
  end

  def count_output_chars
    @count_output_chars = IO.readlines("./lib/#{@argv[1]}", "r")
    @count_output_chars = @count_output_chars.flatten
    @count_output_chars = @count_output_chars[0].split("").length
    #this takes the array made up of 1 line of text per element, flattens the elements into 1, splits it up to count the characters
    "Created 'Output.txt' containing  #{@count_output_chars}  characters"
  end

end

inout = InOut.new
inout.count_output_chars
