class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :genre
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs

  validates :title, presence: true, uniqueness: { scope: :artist, message: 'Song Already Exists for that Artist'}
  validates :artist_name, presence: true
  validates :genre_name, presence: true

  def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def genre_name
    self.try(:genre).try(:name)
  end

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end
  
end
