def filter(num_arr, **kwargs)
	min = kwargs[:min]
	max = kwargs[:max]
	odd = kwargs[:odd]
	even = kwargs[:even]
	scale = kwargs[:scale]

	index = 0
	while index < num_arr.length
		num = num_arr[index]
		index = index + 1
		
		next unless (min.nil? || num >= min)
		next unless (max.nil? || num <= max)
		next unless (odd.nil? || num % 2 != 0)
		next unless (even.nil? || num % 2 == 0)
		yield scale.nil? ? num : num*scale
	end
end

test_arr = [1124, 14, 5, 12.01, 25, 701, 822]

puts "Run 1"
# Expect 42, 2466
filter(test_arr, :min => 11, :max => 1000, :even => 1, :scale => 3){|i| puts i}

puts "Run 2"
# Expect 25, 60.05, 125
filter(test_arr, :min => 5, :max => 25, :odd => 1, :scale => 5) {|i| puts i}