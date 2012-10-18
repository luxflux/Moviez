class TMDBMovieSearchController < ApplicationController

  respond_to :json

  def show
    @movie = MovieFullPreviewDecorator.decorate(MovieShortPreviewDecorator.decorate(TmdbMovie.find(id: params[:id], expand_results: true)))
    render json: @movie
  end

  def create
    @movies = MovieShortPreviewDecorator.decorate(TmdbMovie.find(title: params[:title], expand_results: false))
    render json: @movies
  end

end
