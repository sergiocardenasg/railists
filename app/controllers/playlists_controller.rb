class PlaylistsController < ApplicationController
    def index
        @playlists = Playlist.all
    end
    
    def show
        @playlist = Playlist.find(params[:id])
    end

    def new
        @playlist = Playlist.new
    end

    def create
        @playlist = Playlist.new(playlist_params)
        @playlist.user_id = current_user.id
        if @playlist.save
            redirect_to playlist_path(@playlist)
        else
            render :new
        end
    end

    def edit
        @playlist = Playlist.find(params[:id])
    end

    def update
        @playlist = Playlist.find(params[:id])

        @playlist.update(playlist_params)

        if @playlist.save
            redirect_to @playlist
        else
            render :edit
        end
    end

    def destroy
        @playlist = Playlist.find(params[:id])
        @playlist.destroy
        flash[:notice] = "Song deleted."
        redirect_to songs_path
    end

    private

    def playlist_params
        params.require(:playlist).permit(:name)
    end
end
