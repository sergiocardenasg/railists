class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_songs
  has_many :songs, through: :playlist_songs
  has_many :artists, through: :songs
  has_many :genres, through: :songs

  scope :ordered_by_name, -> { order(name: :asc) }

  validate :already_exists

  def already_exists
    songs.each do |song|
      song.find_by(song.id)
      return true
    end
  end

end