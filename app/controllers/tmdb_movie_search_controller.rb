class TMDBMovieSearchController < ApplicationController

  respond_to :json

  def create
    @movies = TmdbMovie.find(title: params[:title], expand_results: false)
    p @movies.inspect
    respond_with(@movies)
  end

end
