# The global constant ARGF (also accessible as $<) provides an IO-like stream which allows access to all files mentioned on the command line (or STDIN if no files are mentioned). ARGF#path and its alias ARGF#filename are provided to access the name of the file currently being read.

# open(fd, mode="r" [, opt]) → io
# open(fd, mode="r" [, opt]) { |io| block } → obj
# With no associated block, IO.open is a synonym for ::new. If the optional code block is given, it will be passed io as an argument, and the IO object will automatically be closed when the block terminates. In this instance, ::open returns the value of the block.
#
# See ::new for a description of the fd, mode and opt parameters.


arr = ['abcd']
arr = arr[0].split("")
  #=> ["a", "b", "c", "d"]


2
down vote
arr.first.split('')
  #=> ["a", "b", "c", "d"]
