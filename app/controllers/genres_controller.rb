class GenresController < ApplicationController
    def index
      if logged_in?
        @genres = Genre.all
      else
        redirect_to root_path     
      end
    end
    
    def show
      if logged_in?
        @genre = Genre.find(params[:id])
      else
        redirect_to root_path     
      end
    end
    
    def new
      if logged_in?
        @genre = Genre.new
      else
        redirect_to root_path     
      end
    end
  
    def create
      if logged_in?
        @genre = Genre.new(genre_params)
        if @genre.save
          redirect_to genres_path
        else
          render :new
        end
      else
        redirect_to root_path     
      end
    end
  
    def edit
      if logged_in?
        @genre = Genre.find(params[:id])
      else
        redirect_to root_path     
      end
    end
  
    def update
      if logged_in?
        @genre = Genre.find(params[:id])
        @genre.update(genre_params)
        if @genre.save
          redirect_to @genre
        else
          render :edit
        end      
      else
        redirect_to root_path     
      end
    end
  
    def destroy
      if logged_in?
        @genre = Genre.find(params[:id])
        if @genre.songs.empty?
          @genre.destroy
        else
          flash[:notice] = "Please delete all the genre songs before deleting genre."
        end
        redirect_to genres_path
      else
        redirect_to root_path     
      end
    end
  
    private
  
    def genre_params
      params.require(:genre).permit(:name)
    end
end
