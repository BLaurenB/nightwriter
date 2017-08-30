
class Runner

  def initialize
    @file_chars_array = []
  end

  def read_in_file
    @file_chars_array = IO.readlines("./data/#{ARGV[0]}")
  end

  def write_to_file(written_translation) #this works
    File.open("./data/#{ARGV[1]}", "w") do |f|
      f.write(written_translation)
    end
  end

  def count_output_chars
    @count_output_chars = IO.readlines("./data/#{ARGV[1]}")
    @count_output_chars = @count_output_chars.flatten.join("").length
    puts "Created '#{ARGV[1]}' containing #{@count_output_chars} characters."
  end

end
