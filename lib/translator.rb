require './lib/night_write'
require './lib/night_read'
require './lib/runner'
require './lib/dictionary'

class Translator

  def initialize
    @night_write = NightWrite.new
    @dictionary = Dictionary.new
    @runner = Runner.new
    @night_read = NightRead.new
  end

  def run_english_to_braille
    some_method_from_runner
    # this will return a single string of english
    @night_write.word_translation()
    #@night_write.write_braille
    #we think this is called in another method
    @night_write.slice_lines(line_1, line_2, line_3)
    #open and write to file
  end



end
