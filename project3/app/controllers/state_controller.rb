class StateController < ApplicationController
	def filter
		@title = 'States Filter'
		@substring = params.fetch(:substring, "")
		@filtered = State.filter(@substring)
	end
end