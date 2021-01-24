class SongsController < ApplicationController
    def index
      if logged_in?
        @songs = Song.ordered_by_title
      else
        redirect_to root_path     
      end
    end
  
    def show
      if logged_in?
        @song = Song.find(params[:id])
      else
        redirect_to root_path     
      end
    end
  
    def new
      if logged_in?
        @song = Song.new
      else
        redirect_to root_path     
      end
    end
  
    def create
      if logged_in?
        @song = Song.new(song_params)
        if @song.save
          redirect_to song_path(@song)
        else
          render :new
        end      
      else
        redirect_to root_path     
      end
    end

    def edit
      if logged_in?
        @song = Song.find(params[:id])
      else
        redirect_to root_path     
      end
    end
  
    def update
      if logged_in?
        @song = Song.find(params[:id])
        @song.update(song_params)
        if @song.save
          redirect_to @song
        else
          render :edit
        end
      else
        redirect_to root_path     
      end
    end
  
    def destroy
      if logged_in?
        @song = Song.find(params[:id])
        if @song.playlists.empty?
          @song.destroy
        else
          flash[:notice] = "Please make sure this song is not present in any playlists before deleting it."
        end
        redirect_to songs_path
      else
        redirect_to root_path     
      end
    end
  
    private
  
    def song_params
      params.require(:song).permit(:title, :artist_name, :genre_name)
    end
  end
  
  