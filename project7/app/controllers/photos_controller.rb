class PhotosController < ApplicationController
	def show
		user = User.find(params[:user_id])
		@admin = params[:user_id].to_i == session[:login_id].to_i
		@title = "#{user.first_name} #{user.last_name}"
		@photos = user.photos
	end

	def new
		@title = "Upload A Photo"
	end

	def create
		uploaded_io = params[:photo]
		filename = uploaded_io.original_filename
		path = Rails.root.join('app', 'assets', 'images', filename)

		if File.exists?(path)
			flash[:error] = "Filename already exists."
		else
			File.open(path, 'wb') do |file|
				file.write(uploaded_io.read)
			end

			loginUser = User.find(session[:login_id])
			photo = Photo.new()
			photo.user = loginUser
			photo.file_name = filename
			photo.date_time = DateTime.now
			photo.save!
			flash[:notice] = "Successfully uploaded file: #{photo.file_name}"
		end

		redirect_to :action => 'show', :user_id => session[:login_id]
	end
end
