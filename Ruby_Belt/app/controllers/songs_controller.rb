class SongsController < ApplicationController
	def dashboard
	  	@user = User.find(session[:user_id])
	  	@songs = Song.all
	end

	def create
		new_song = Song.new(title: params[:song][:title], artist: params[:song][:artist], times_added:)
		if !new_song.valid?
			flash[:notice] = new_song.errors.messages
			redirect_to "/songs/dashboard"
		else
			new_song.save
			redirect_to "/songs/dashboard"
		end
	end

	def add
		song_added = Song.find(params[:id])
		song_added.increment(:times_added)
		exists = Playlist.all.where(song: params[:id]).find_by(user: session[:user_id])
		if !exists
			user = User.find(session[:user_id])
			song = Song.find(params[:id])
			user.songs.push(song)
			redirect_to "/songs/dashboard"
		else
			update_count = Playlist.all.where(song: params[:id])
			update_count.find_by(user: session[:user_id]).increment(:times_added).save
			redirect_to "/songs/dashboard"
		end
	end

	def show
		@song = Song.find(params[:id])
		@playlists = Playlist.all.where(song: params[:id])
	end
end
