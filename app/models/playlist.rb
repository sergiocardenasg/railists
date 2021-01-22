class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_songs
  has_many :songs, through: :playlist_songs
  has_many :artists, through: :songs
  has_many :genres, through: :songs

  validates :song_id, uniqueness: {confirm: 'Song is already in the playlist, are you sure you want to add it again?' }


end