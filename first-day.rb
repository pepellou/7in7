# Breaking the ice...
properties = [ 
	'object oriented',
	'duck-typed',
	'productive',
	'fun'
]
properties.each { |property| puts "Ruby is #{property}" }

# two types of strings...
language = "Ruby"
puts "Hi #{language}"
puts 'Hi #{language} <-- this is crap'

# everything is an object!
puts 42.class
puts 42.methods.take 10
puts 42.class.class
puts false.class

# conditionals appear to be easy to read...
job = :bad
puts "nice job" unless job == :bad
puts "you should work more!" if job == :bad

# the other way round is possible, but newline and end are mandatory
unless job == :bad 
	puts "nice job" 
end
if job == :bad 
	puts "you should work more!" 
end

# we have loops, as expected
x = 1
x = x + 1 while x < 43
x = 1
x = x + 1 until x == 42
num = 1
sum = 6
while num < 13
	sum += num
	num += 2
end
puts sum

# almost everything is true
puts "Sip" if true
puts "Sip" if 1
puts "Sip" if 0

# only nil and false are evaluated false
puts "Nop" unless false
puts "Nop" unless nil

# we can use logical short-circuit operators in bash-style
42 == 666666 / 111 / 13 / 11 || this_aint_gonna_happen
42 == 666666 / 111 / 13 / 11 && "Ruby works as a calculator"

# Ruby is strong typed
false && 42 + 'this would crash'
puts 12 + 30.0

# hey, it's easy to create a function
def give_me_the_answer
	42
end
puts give_me_the_answer

# and here is an example of duck typing
numbers = ['30', 12]
puts numbers.inject(0) { |sum, elem| sum + elem.to_i }

# by the way, I introduced you to the tricky clever 'inject' in last example :-)
