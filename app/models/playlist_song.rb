class PlaylistSong < ApplicationRecord
  belongs_to :playlist
  belongs_to :song

  validates :song_id, presence: true
  validates :playlist_id, presence: true

  def song_title
    self.try(:song).try(:title)
  end

  def song_title=(title)
    song = Song.find_or_create_by(title: title)
    self.song = song
  end

  def playlist_name
    self.try(:playlist).try(:name)
  end

  def playlist_name=(name)
    playlist = Playlist.find_or_create_by(name: name)
    self.playlist = playlist
  end
end
