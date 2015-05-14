
def each_starts_with(arr, prefix)
	index = 0
	while index < arr.length
		yield arr[index] if arr[index].start_with?(prefix)
		index = index + 1
	end
end

each_starts_with(["batboy", "batman", "harhar", "robin", "batgirl", "batball"], "bat") {|arg| puts arg }