class MoviesController < ApplicationController

  respond_to :html, :json

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.text_search(params[:query])
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
    @movie = Movie.new(params[:movie])
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
