class CommentsController < ApplicationController
	def index
		@title = "View All Comments"
		@comments = Comment.all
	end

	def create
		comment = params[:comment]
		if comment != ""
			loginUser = User.find(session[:login_id])
			commentPhoto = Photo.find(params[:photo_id])
			# Error if not logged in
			newComment = Comment.new()
			newComment.user = loginUser
			newComment.photo = commentPhoto
			newComment.comment = comment
			newComment.date_time = DateTime.now
			newComment.save!
		else
			flash[:error] = 'Comment cannot be empty'
		end
		redirect_to :controller => 'photos', :action => 'show', :user_id => params[:user_id] 
	end
end
