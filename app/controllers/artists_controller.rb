class ArtistsController < ApplicationController
    def index
      if logged_in?
        @artists = Artist.ordered_by_name
      else
        redirect_to root_path     
      end
    end
  
    def show
      if logged_in?
        @artist = Artist.find(params[:id])
      else
        redirect_to root_path     
      end
    end
  
    def new
      if logged_in?
        @artist = Artist.new
      else
        redirect_to root_path     
      end
    end
  
    def create
      if logged_in?
        @artist = Artist.new(artist_params)
        if @artist.save
          redirect_to artists_path
        else
          render :new
        end      
      else
        redirect_to root_path     
      end
    end
  
    def edit
      if logged_in?
        @artist = Artist.find(params[:id])
      else
        redirect_to root_path     
      end
    end
  
    def update
      if logged_in?
        @artist = Artist.find(params[:id])
        @artist.update(artist_params)
        if @artist.save
          redirect_to @artist
        else
          render :edit
        end
      else
        redirect_to root_path     
      end
    end
  
    def destroy
      if logged_in?
        @artist = Artist.find(params[:id])
        if @artist.songs.empty?
          @artist.destroy
        else
          flash[:notice] = "Please delete all the artists songs before deleting artist."
        end
        redirect_to artists_path
      else
        redirect_to root_path     
      end
    end
  
    private
  
    def artist_params
      params.require(:artist).permit(:name)
    end
  end  