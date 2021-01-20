class PlaylistSongsController < ApplicationController
    def index
        
    end
    
    def new
        @playlist_song = PlaylistSong.new
    end

    def create
        @playlist_song = PlaylistSong.new(playlistsong_params)
        if @playlist_song.save
            redirect_to playlists_path
        else
            render :new
        end
    end

    private

    def playlistsong_params
        params.require(:playlist_song).permit(:playlist_name, :song_title)
    end
end
