class TMDBMovieSearchController < ApplicationController

  respond_to :json

  def create
    @movies = MoviePreviewDecorator.decorate(TmdbMovie.find(title: params[:title], expanded_results: false))
    respond_with(@movies)
  end

end
