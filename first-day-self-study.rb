# Find...

# ... the Ruby API
rubyApi = "http://ruby-doc.org/core/"

# ... the free online version of "Programming Ruby: The Pragmatic Programmer's Guide"
programmingRubyGuide = "http://www.ruby-doc.org/docs/ProgrammingRuby/"

# ... a method that substitutes part of a string
puts "A method for substituting part of a string is this".gsub("this", "gsub")

# ... information about Ruby's regular expressions
puts "link: http://www.regular-expressions.info/ruby.html"
	.gsub("link:", "A good place to start with regular expressions is")

# ... information about Ruby's ranges
rangesDoc = "www.ruby-doc.org/core/classes/Range.html"


# Print the string "Hello, world."
puts "Hello, world."

# For the string "Hello, Ruby," find the index of the word "Ruby."
puts "Hello, Ruby,".index("Ruby.")  # this won't print anything, because you want to do...
puts "Hello, Ruby".index("Ruby")

# Print your name ten times.
(1..10).each { puts "pepellou" }
#    but nicer could be...
10.times { puts "pepellou" }

# Print the string "This is the sentence number 1," where the number 1 changes from 1 to 10
(1..10).each { |num| puts "This is the sentence number #{num}" }

# Run a Ruby program from a file
"ruby <file>"

# Bonus problem: pick & guess a number
number = rand(100)
guess = -1
until guess == number do
	print "Guess the number (0-99): "
	guess = gets.to_i	
	puts "Not enough!" if (guess < number)
	puts "Too much!" if (guess > number)
end
puts "Got it!"
