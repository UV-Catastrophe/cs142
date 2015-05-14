
def string_value(str)
	raise(ArgumentError, "string_value argument must be a string") unless str.kind_of?(String)
	res = /\A\D*(?<num_val>\d+)/.match(str)
	res.nil? ? -1 : res[:num_val].to_i
end

def funny_sort(str_arr)
	raise(ArgumentError, "funny_sort argument must be an array") unless str_arr.kind_of?(Array)
	str_arr.sort_by{|i| string_value(i)}
end


def sort_and_print(str_arr)
	puts "Results for sorting " + str_arr.inspect + ":"
	p funny_sort(str_arr)
	puts ""
end

sort_and_print(["2al;k9", " ,ca;sd900", "aaa", "100025", ""])
sort_and_print([])
sort_and_print(["","9,000","asd;glhia8a;s8s88s9"])

