class PhotosController < ApplicationController
	def show
		user = User.find(params[:user_id])
		@title = "#{user.first_name} #{user.last_name}"
		@photos = user.photos
	end
end
