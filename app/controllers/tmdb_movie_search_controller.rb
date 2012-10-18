class TMDBMovieSearchController < ApplicationController

  respond_to :json

  def create
    @movies = MoviePreviewDecorator.decorate(TmdbMovie.find(title: params[:title], expand_results: true))
    respond_with(@movies)
  end

end
