# defining functions is so easy
def tell_the_truth
	42
end

# the last sentence of a function is returned
puts tell_the_truth

# arrays are a lot of fun!
words = ["these", "are", "words", "in", "an", "array"]
puts words[-1]
puts words[0..2].join " "
words.each { |word| print word + " " }
puts
puts words.shuffle.join(" ")

# the selector [] is a method
puts words[5]
if words.methods.include?(:[]) 
	puts words.[] 5
end

# lets define a useful method to print an array in one single line
# we can define methods to existing classes!!
class Array
	def print
		puts self.join " "
	end
end

# we can use arrays as a stack...
words.push "of"
words.push "words"
words.print
puts words.pop
puts words.pop
words.print

# or as a queue
words.unshift "that"
words.unshift "seems"
words.unshift "It"
words.print
puts words.shift
puts words.shift
puts words.shift
words.print

# hashes are nice datastores...
pepe = { :job => "programmer", :interests => ["chess", "craftsmanship"] }
puts pepe

# symbols are unique
puts "Symbols are unique!" if :job.object_id == :job.object_id
puts "Other data isn't unique" unless "job".object_id == "job".object_id

# blocks are the kind of thing that rocks!
3.times { puts "Penny!" }

# let's do something cool with blocks:
class Fixnum
	def eachTo(to)
		from = self
		inc = 1
		inc = -1 if to < from
		until from == to do
			yield from
			from += inc
		end
		yield from
	end
end
4.eachTo(7) { |num| puts "This is number #{num}" }

# we can also store blocks!
def program(tasks, hour, &task)
	tasks[hour] = task
end
def list_programmed(tasks)
	tasks.sort.each { |hour, task| puts " * task at #{hour}" }
end
def run_task(tasks, hour)
	tasks[hour].call
end
tasks = Hash.new
program(tasks, "15:00") { puts "It's late!" }
program(tasks, "12:00") { puts "It's noon!" }
list_programmed tasks
run_task(tasks, "15:00")

# classes are objects
puts 42.class
puts 42.class.class
puts 42.class.class.superclass
puts 42.class.class.superclass.superclass

# mixins are simple!
module Serializable
	def filename
		"obj#{self.object_id}.txt"
	end
	def to_f
		File.open(filename, 'w' ) { |file| file.write(to_s) }
	end
end
class Person
	include Serializable
	attr_accessor :name
	attr_accessor :job
	def initialize(name, job)
		@name = name
		@job = job
	end
	def to_s
		"#{name} (#{job})"
	end
end
Person.new('pepe', 'programmer').to_f

# the spaceship operator is typically used for ordering...
puts 1 <=> 2
puts 1 <=> 1
puts 1 <=> 0

# for example, to order a hash by their values (not the keys):
class Hash
	def print
		self.each { |key, value| puts " #{key} => #{value}" }
	end
end
tasks = {
	"12:00" => "gym",
	"13:00" => "eat",
	"15:00" => "read a book",
	"17:00" => "clean the house"
}
Hash[tasks.sort { |elem1, elem2| elem1[1] <=> elem2[1] }].print
# note: Hash[array] is a trick to convert array to hash,
#       which is needed due to "sort" converting the hash
#       into an array.

# Finally, let's do some cool stuff with methods on collections:
numbers = (1..2 * tell_the_truth)
odd_ones = numbers.select { |num| num % 2 == 1 }
sum_odds = odd_ones.inject { |sum, num| sum + num }
puts "We've discovered the whole truth!" if sum_odds == tell_the_truth * tell_the_truth
