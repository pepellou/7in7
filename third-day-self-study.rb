# Modify the CSV application to support an each method to return a
# CsvRow object. Use method_missing on that CsvRow to return the value
# for the column for a given heading.
# 
# For example, for the file:
#   one, two
#   lions, tigers
# allow an API that works like this:
#   csv = RubyCsv.new
#   csv.each {|row| puts row.one}
#
# This should print "lions".

class CsvRow
	attr_accessor :hash

	def initialize(hash)
		@hash = hash
	end

	def method_missing name, *args
		@hash[name.to_s]
	end
end

module ActsAsCsv

	def self.included(base)
		base.extend ClassMethods
	end

	module ClassMethods
		def acts_as_csv
			include InstanceMethods
		end
	end

	module InstanceMethods
		def read
			@csv_contents = []
			filename = self.class.to_s.downcase + '.txt'
			file = File.new(filename)
			@headers = file.gets.chomp.split(', ' )
			file.each do |row|
				@csv_contents << row.chomp.split(', ' )
			end
		end

		def each
			@csv_contents.each do |row|
				yield CsvRow.new(Hash[@headers.zip(row)])
			end
		end

		attr_accessor :headers, :csv_contents

		def initialize
			read
		end
	end
end

class RubyCsv
	include ActsAsCsv
	acts_as_csv
end

row = CsvRow.new({"one" => 1, "two" => 2})
puts row.one

csv = RubyCsv.new
csv.each {|row| puts row.one}
