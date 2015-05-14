class Adder
	def initialize(shift)
		@shift = shift
		
	end

	def method_missing(meth_name)
		res = /^plus(?<plus_num>\d+)$/.match(meth_name) # Looks for methods of the form plusN, where N is an integer
		if res.nil?
			raise(NoMethodError, "Undefined method " + meth_name.to_s + " for " + self.class.to_s)
		else
			plus_num = res[:plus_num].to_i
			self.class.send(:define_method, meth_name) {@shift + plus_num}
			self.send(meth_name)
		end
    end
end


adder = Adder.new(12)

puts "Call plus15 twice, plus20 4 times, minus5 once"
p adder.plus15
p adder.plus15
p adder.plus20
p adder.plus20
p adder.plus20
p adder.plus20
p adder.minus5 # We expect an exception here