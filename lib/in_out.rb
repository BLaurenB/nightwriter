



class InOut

  def initialize()
    @file_chars_array = []
  end


  def read_in_file
    @file_chars_array = IO.readlines("./data/#{ARGV[0]}")
    # this returns each line of text in an array where each line is its own element
  end


  def write_to_file #this works
    File.open("./data/#{ARGV[1]}", "w") do |f|
    #this opens a file to write to it.
      f.write(@file_chars_array << "This is a new line of text.")
      #this adds another line as an array element.
    end
  end

  def count_output_chars
    @count_output_chars = IO.readlines("./data/#{ARGV[1]}")
    @count_output_chars = @count_output_chars.flatten
    @count_output_chars = @count_output_chars[0].split("").length
    #this takes the array made up of 1 line of text per element, flattens the elements into 1, splits it up to count the characters
    "Created 'Output.txt' containing  #{@count_output_chars}  characters"
  end
end

inout = InOut.new
inout.read_in_file
inout.write_to_file
inout.count_output_chars
puts inout.count_output_chars
