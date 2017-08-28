#fixed version, 0827-0630


require 'pry'

# my_array = IO.readlines('filename.txt')

class InOut

  attr_accessor :argv

  def initialize()
    @file_chars_array = []
  end


  def read_in_file

    @file_chars_array = IO.readlines("./lib/#{ARGV[0]}") #un-comment this when I figure out what's actually ebing returned.
    # this returns each line of text in an array where each line is its own element
  end


  def write_to_file #this works
    File.open("./lib/Output_test.txt", "w") do |f|
    #this opens a file to write to it.
      f.write(@file_chars_array << "This is a new line of text.")
      #this adds another line as an array element.
    end
  end

  def count_output_chars
    @count_output_chars = IO.read("./lib/Output_test.txt", "r")

    #puts "./lib/#{ARGV[1]}" #This prints as anticipated

    # @count_output_chars = @count_output_chars.flatten
    # @count_output_chars = @count_output_chars[0].split("").length
    # #this takes the array made up of 1 line of text per element, flattens the elements into 1, splits it up to count the characters
    # "Created 'Output.txt' containing  #{@count_output_chars}  characters"
  end
end

# inout = InOut.new
# puts inout.count_output_chars
