class CommentsController < ApplicationController
	def index
		@title = "View All Comments"
		@comments = Comment.all
	end
end
