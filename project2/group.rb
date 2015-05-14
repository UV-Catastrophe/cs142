module Enumerable
	def each_group_by_first_char
		groups = Hash.new

		self.each { |word| 
			fc = word[0]
			unless fc.nil?
				groups[fc] = Array.new unless groups.has_key?(fc)
				groups[fc].push(word)
			end
		}
		index = 0
		while index < groups.keys.length
			key = groups.keys[index]
			yield key, groups[key]
			index += 1
		end

	end
end

# Verify
x = ["axle", "aardvar", "zebra", "katmandu", "zorb", "elondrious", "apoplyptic", "kylesandmitch", "", ""]
x.each_group_by_first_char do |char, words|
	printf("%s: %s\n", char, words.join(" "));
end