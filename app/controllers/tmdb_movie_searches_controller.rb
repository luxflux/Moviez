class TMDBMovieSearchesController < ApplicationController

  respond_to :json

  def create
    @movies = MoviePreviewDecorator.decorate(TmdbMovie.find(title: params[:title], expand_results: true))
    render json: @movies
  end

end
