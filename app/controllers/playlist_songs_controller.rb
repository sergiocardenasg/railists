class PlaylistSongsController < ApplicationController
    def index
        
    end
    
    def new
        @playlist_song = PlaylistSong.new
    end

    def create
        @playlist_song = PlaylistSong.new(playlist_song_params)
        if @playlist_song.save
            redirect_to root_path
        else
            render :new
        end
    end

    private

    def playlist_song_params
        params.require(:playlist_song).permit(:song_title, :playlist_name)
    end
end
