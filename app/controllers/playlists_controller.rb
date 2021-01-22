class PlaylistsController < ApplicationController
    def index
        if logged_in? 
            @playlists = Playlist.ordered_by_name
        else
            redirect_to root_path     
        end
    end
    
    def show
        if logged_in?
            @playlist = Playlist.find(params[:id])
        else
            redirect_to root_path     
        end
    end

    def new
        if logged_in?
            @playlist = Playlist.new
        else
            redirect_to root_path     
        end
    end

    def create
        if logged_in?
            @playlist = Playlist.new(playlist_params)
            @playlist.user_id = current_user.id
            if @playlist.save
                redirect_to playlist_path(@playlist)
            else
                render :new
            end
        else
            redirect_to root_path     
        end
    end

    def edit
        if logged_in?
            @playlist = Playlist.find(params[:id])
        else
            redirect_to root_path     
        end
    end

    def update
        if logged_in?
            @playlist = Playlist.find(params[:id])
            @playlist.update(playlist_params)
            if @playlist.save
                redirect_to @playlist
            else
                render :edit
            end
        else
            redirect_to root_path     
        end
    end

    def destroy
        if logged_in?
            @playlist = Playlist.find(params[:id])
            if @playlist.songs.empty?
              @playlist.destroy
            else
              flash[:notice] = "Please delete all the songs in the playlist before deleting the playlist."
            end
            redirect_to playlists_path
        else
            redirect_to root_path     
        end
    end

    private

    def playlist_params
        params.require(:playlist).permit(:name)
    end
end
