class UsersController < ApplicationController
	def index
		@title = "The Cast"
		@users = User.all
	end
end
