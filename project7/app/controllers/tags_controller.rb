class TagsController < ApplicationController

	def index
		@title = 'View All Tags'
		@tags = Tag.all
	end

	def create
		tag = Tag.new()
		tag.user = User.find(params[:tagged_user_id])
		tag.photo = Photo.find(params[:photo_id])
		tag.left_px = params[:left_px]
		tag.top_px = params[:top_px]
		tag.width_px = params[:width_px]
		tag.height_px = params[:height_px]
		tag.save!

		redirect_to :controller => 'photos', :action => 'show', :user_id => tag.photo.user
	end

	def delete
		tag = Tag.find(params[:tag_id])
		tag_user = tag.photo.user
		tag.destroy!
		redirect_to :controller => 'photos', :action => 'show', :user_id => tag_user
	end
end
