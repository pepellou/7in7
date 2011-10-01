# Opening existing classes are a nice tool to define our domain
class Numeric
	def fahrenheit
		self
	end
	def celsius
		self * 9 / 5 + 32
	end
	def more
		self
	end
	def less
		self * -1
	end
end
puts 68.fahrenheit
puts 20.celsius
puts 68.fahrenheit + 20.celsius.more
puts 68.fahrenheit + 68.fahrenheit.more

# method_missing lets us do cooooool things:
class UpperCaser
	def self.method_missing name, *args
		name.to_s.upcase
	end
end
puts UpperCaser.sampleWord

# with macros we can do objects behave different depending on context...
class Numeric

	def self.actAsWeight
		define_method 'inspect' do
			"#{self} kg"
		end
	end

	def self.actAsDistance
		define_method 'inspect' do
			"#{self} m"
		end
	end

end

puts 4.inspect

class Numeric
	actAsWeight
end

puts 4.inspect

class Numeric
	actAsDistance
end

puts 4.inspect
