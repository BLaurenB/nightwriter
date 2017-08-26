require 'pry'

# my_array = IO.readlines('filename.txt')

class InOut

  def read_in_file
    @file_chars_array = IO.readlines("./lib/test_text_file.txt")
    # this returns 2 (2 lines that are separated into 2 array elements)
  end


  # def count_chars_in_read_file
  #   @count_chars_in_file = @file_chars_array
  #     @count_chars_in_file[0].split("").length
  # end

  def write_to_file #this works
    File.open("./lib/Output.txt", "w") do |file|
      file.write(@file_chars_array << "This is a new line of text.") #this also works by sending an array to teh text file_chars_array

    end
  end

  def count_output_chars
    @count_output_chars = IO.readlines("./lib/Output.txt")
    @count_output_chars.flatten
    @count_output_chars[0].split("").length
  end

  puts "Created 'Output.txt' containing #{@count_output_chars} chars"


end

inout = InOut.new
# binding.pry
inout.read_in_file
inout.write_to_file
