class UsersController < ApplicationController
	def index
		@title = "The Cast"
		@users = User.all
	end

	def login
		@title = "Login"
	end

	def post_login
		login = params[:login]
		password = params[:password]
		loginUser = User.find_by login: login

		if loginUser.nil? || !loginUser.password_valid?(password)
			flash[:error] = 'Username or password was incorrect'
			redirect_to :action => 'login'
		else
			session[:login_id] = loginUser.id
			flash[:notice] = "Welcome, #{loginUser.first_name}!"
			redirect_to :action => 'index'
		end
	end

	def logout
		session[:login_id] = nil
		flash[:notice] = 'You have been succesfully logged out.'
		redirect_to :action => 'index'
	end

	def new
		@title = "Register"
		@user = User.new()
	end

	def create
		@title = "Register"
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "User successfully created - Welcome, #{@user.first_name}!"
			session[:login_id] = @user.id
			redirect_to :action => 'index'
		else
			flash[:error] = 'Failed to create user'
			render 'new'
		end
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :login, :password, :password_confirmation)
		end
end
