class UsersController < ApplicationController
	def main
	end

	def register
 		user = User.new(user_params)
		if !user.valid?
			flash[:notice] = user.errors.messages
		end
		user.save
		@user = user
		session[:user_id] = user.id
		redirect_to "/songs/dashboard"
	end

	def login
		user = User.find_by(email: params[:user][:email])
	  	if user.authenticate(params[:user][:password])
			session[:user_id] = user.id
		  	redirect_to "/songs/dashboard"
	  	else
		  	flash[:notice] = "Incorrect credentials"
		  	redirect_to "/main"
	  	end
	end

	def logout
		session[:user_id] = nil
	  	redirect_to "/main"
	end

	def show
		@user = User.find(params[:id])
		@playlists = Playlist.all.where(user: params[:id])
	end

	private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  	end
end
