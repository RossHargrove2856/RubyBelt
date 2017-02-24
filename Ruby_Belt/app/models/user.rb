class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :email, :password, presence: true
  has_many :playlists
  has_many :songs, through: :playlists
end
