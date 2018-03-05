NightWriter is a project assigned at Turing School of Software and Design, completed by Lauren Billington and Dione Wilson. 

From http://backend.turing.io/module1/projects/night_writer :
NIGHTWRITER
Base Expectations

The tool is used from the command line like so:

$ ruby ./lib/night_write.rb message.txt braille.txt
Created 'braille.txt' containing 256 characters
That will use the plaintext file message.txt to create a Braille simulation file braille.txt.

Then we can convert that Braille simulation back to normal text:

$ ruby ./lib/night_read.rb braille.txt original_message.txt
Created 'original_message.txt' containing 256 characters.


Simulating Braille

Braille uses a two-by-three grid of dots to represent characters. We’ll simulate that concept by using three lines of symbols:

0.0.0.0.0....00.0.0.00
00.00.0..0..00.0000..0
....0.0.0....00.0.0...
The 0 represents a raised dot. The period is an unraised space. The above code reads “hello world” in normal text. You can experiment with converting other words yourself and share some samples with your classmates.

Let’s also constrain our Braille files to 80 braille characters (160 dots) wide.

We also need to support capitalization. In Braille, capitalization comes from a shift character. You’ll find that character at the end of the fourth row of the previous graphic. When that character appears, the next character (and only the next character) is a capital. So e comes out as one 2x3 set of Braille points, but E is 4x3: the shift character followed by the normal e. Consider how this will affect your line width restrictions.

