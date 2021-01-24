class PlaylistSongsController < ApplicationController

    # def index
    #     if logged_in?
    #         @playlists = current_user.playlists
    #     else
    #         redirect_to root_path     
    #     end
    # end

    def show
        @playlist_song = PlaylistSong.find(params[:id])
        if current_user == @playlist_song.playlist.user
            @playlist_song = PlaylistSong.find(params[:id])
        else
            redirect_to root_path     
        end
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
