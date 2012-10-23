class MoviesController < ApplicationController

  respond_to :js, :html, :json

  # GET /movies
  # GET /movies.json
  def index
    @movies = MovieDecorator.decorate(Movie.text_search(params[:query]))
    respond_with @movies
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @movie = Movie.find(params[:id])
    respond_with @movie
  end

  # GET /movies/new
  # GET /movies/new.json
  def new
    @movie = Movie.new
    respond_with @movie
  end

  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new
    tmdb_data = TmdbMovie.find(id: params[:movie][:tmdb_id], expand_results: true)
    @movie.load_attributes_from_tmdb_data(tmdb_data)
    @movie.save
    respond_with @movie
  end

  # PUT /movies/1
  # PUT /movies/1.json
  def update
    @movie = Movie.find(params[:id])
    respond_with @movie
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :no_content }
    end
  end
end
