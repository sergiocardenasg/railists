class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :genre
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs
end
