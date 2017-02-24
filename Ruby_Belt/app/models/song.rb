class Song < ApplicationRecord
	attr_accessor :times_added
	validates :title, :artist, presence: true
	validates :title, :artist, length: { minimum: 2 }
	has_many :playlists
    has_many :users, through: :playlists
end
