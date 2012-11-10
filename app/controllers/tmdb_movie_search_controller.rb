class TMDBMovieSearchController < ApplicationController

  respond_to :json

  def show
    @movie = MovieFullPreviewDecorator.decorate(TMDB::Movie.find_by_id(params[:id]))
    render json: @movie
  end

  def create
    @movies = MovieShortPreviewDecorator.decorate(TMDB::Movie.search(title: params[:title]))
    render json: @movies
  end

end
