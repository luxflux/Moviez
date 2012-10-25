class TMDBMovieSearchController < ApplicationController

  respond_to :json

  def show
    @movie = MovieFullPreviewDecorator.decorate(MovieShortPreviewDecorator.decorate(TMDB::Movie.find_by_id(params[:id])))
    render json: @movie
  end

  def create
    @movies = MovieShortPreviewDecorator.decorate(TmdbMovie.find(title: params[:title], expand_results: false))
    render json: @movies
  end

end
