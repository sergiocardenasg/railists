class PlaylistSongsController < ApplicationController
    def index
        @playlist_songs = PlaylistSong.all
    end

    def show
        @playlist_song = PlaylistSong.find(params[:id])
    end
    
    def new
        @playlist_song = PlaylistSong.new
    end

    def create
        @playlist_song = PlaylistSong.new(playlistsong_params)
        if @playlist_song.save
            redirect_to playlist_song_path(@playlist_song)
        else
            render :new
        end
    end

    def new_from_playlist_page
        @playlist_song = PlaylistSong.new
    end

    def create_from_playlist_page
        @playlist_song = PlaylistSong.new(playlistsong_params)
        if @playlist_song.save
            redirect_to playlists_path
        else
            render :new
        end
    end

    def destroy
        @playlist_song = PlaylistSong.find(params[:id])
        @playlist_song.destroy
        redirect_to playlist_songs_path
    end

    private

    def playlistsong_params
        params.require(:playlist_song).permit(:playlist_name, :song_title)
    end
end
