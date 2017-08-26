require 'pry'
# require 'IO'


# # GOAL
# ruby ./lib/night_write.rb message.txt braille.txt
# Created 'braille.txt' containing 256 characters

# my_array = IO.readlines('filename.txt')

class InOut

  def initialize(filename)
    @filename = filename
  end

  def read_in_file(filename)
    IO.foreach(@filename)
  end

  def write_to_file #This works! -
    # File.open("out.txt", [your-option-string - "r", "w", ]) {|f| f.write("write your stuff here") }

    File.open("braille.txt", "w") do |f|
      f << "#{read_in_file}" + "\n \n ...and this is a new line of text added by our script"
      # f << "Here we are with a new line of text"
    end
  end

  # def count_output_characters
  #   IO.foreach(@filename).count
  # end
  #
  #
  # puts "Created 'braille.txt' containing #{count_output_characters} characters"

end

inout = InOut.new("test_text_file.txt")
# binding.pry
inout.read_in_file
inout.write_to_file
