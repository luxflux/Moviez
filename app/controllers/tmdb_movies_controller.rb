class TMDBMoviesController < ApplicationController

  respond_to :json

  def index
    @movies = MovieShortPreviewDecorator.decorate_collection(TMDB::Movie.search(title: params[:title]))
    render json: @movies
  end

  def show
    @movie = MovieFullPreviewDecorator.decorate(TMDB::Movie.find_by_id(params[:id]))
    render json: @movie
  end

end
