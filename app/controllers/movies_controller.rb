class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new_form
  end

  def create_row
    @movie = Movie.new
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]

    @movie.save

    redirect_to("http://localhost:3000/movies/#{@movie.id}")
  end

  def edit_form
    @movie = Movie.find(params[:id])
  end

  def update_row
    @movie = Movie.find_by({ :id => params[:id]})
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]

    @movie.save

    redirect_to("http://localhost:3000/movies/#{@movie.id}")
  end

  def destroy
    @delete_movie = Movie.find_by({ :id => params[:id]})

    @delete_movie.destroy

    redirect_to("http://localhost:3000/movies")
  end
end
