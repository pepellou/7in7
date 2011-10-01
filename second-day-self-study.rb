# Find out how to access files with and without code blocks.
count = 0
file = File.open ("second-day.rb")
file.each_line do |line|
	count += 1
end
file.close
puts "Num of lines: #{count}"

# What is the benefit of the code block?
#  ==> You don't need to close the file nor storing file in
#      a variable you don't need anymore
count = 0
File.open ("second-day.rb") { |f| f.each_line { count += 1} }
puts "Num of lines: #{count}"

# How would you translate a hash to an array? 
hash = { 0 => 1, 1 =>2, 2 => 3 }
puts hash.to_a.join " "
# Can you translate arrays to hashes?
puts Hash[hash.to_a]

#Can you iterate through a hash?
keys = 0
values = 0
hash.each do |key, value|
	keys += key
	values += value
end
puts "Keys: #{keys} | Values: #{values}"

# You can use Ruby arrays as stacks. 
# What other common data structures do arrays support?
#   ==> Since arrays have methods to insert/delete to the
#       beginning or end of array, you can use them as:
#         - stacks
#         - queues
#         - lists
#         - deques

# Print the contents of an array of sixteen numbers, four numbers
# at a time, using just each. Now, do the same with each_slice in
# Enumerable.
numbers = (1..16).to_a

count = 0
numbers.each do |num|
	count += 1
	print num 
	print " "
	if count == 4
		puts
		count = 0
	end
end

numbers.each_slice(4) { |a| puts a.join " " }

# The Tree class was interesting, but it did not allow you to specify
# a new tree with a clean user interface. Let the initializer accept a
# nested structure of hashes. You should be able to specify a tree
# like this: {’grandpa’ => { ’dad’ => {’child 1’ => {}, ’child 2’ => {} }, ’uncle’
# => {’child 3’ => {}, ’child 4’ => {} } } }.
class Tree
	attr_accessor :children, :node_name

	def initialize(structure)
		@node_name = structure.to_a[0][0]
		@children = []
		structure.to_a[0][1].each do |name, children|
			@children.push Tree.new({name => children})
		end
	end

	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end

	def visit(&block)
		block.call self
	end
end
Tree.new({
	'grandpa' => { 
		'dad' => {
			'child 1' => {}, 
			'child 2' => {} 
		}, 
		'uncle' => {
			'child 3' => {}, 
			'child 4' => {} 
		} 
	} 
}).visit_all { |node| puts node.node_name }
# Note: I don't really like that constructor...

# Write a simple grep that will print the lines of a file having any
# occurrences of a phrase anywhere in that line. You will need to do
# a simple regular expression match and read lines from a file. (This
# is surprisingly simple in Ruby.) If you want, include line numbers.
file = "second-day-self-study.rb"
pattern = /.*anywhere.*/
File.open(file).readlines.select { |l| l.match(pattern) }.each { |l| puts l }
