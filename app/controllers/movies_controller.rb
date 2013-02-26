class MoviesController < ApplicationController

  load_and_authorize_resource

  respond_to :js, :html, :json

  # GET /movies
  # GET /movies.json
  def index
    @movies = @movies.text_search(params[:query]).order('title').page(params[:page])
    @movies = MovieDecorator.decorate @movies
    respond_with @movies
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @movie = MovieDecorator.decorate(@movie)
    respond_with @movie
  end

  # GET /movies/new
  # GET /movies/new.json
  def new
    respond_with @movie
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    tmdb_id = params[:tmdb_id] || params[:movie][:tmdb_id]
    tmdb_data = TMDB::Movie.find_by_id(tmdb_id)
    @movie.load_attributes_from_tmdb_data(tmdb_data)
    @movie.disc_number = params[:disc_number] || params[:movie][:disc_number]
    @movie.save
    respond_with @movie
  end

  # PUT /movies/1
  # PUT /movies/1.json
  def update
    @movie.update_attributes(params[:movie])
    respond_with(@movie) do |format|
      format.js do
        flash[:success] = I18n.t('movies.update.ok')
        render js: 'window.location.reload()'
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_with(@movie)
  end

  # PUT /movies/1/auto_update.json
  def auto_update
    tmdb_data = TMDB::Movie.find_by_id(@movie.tmdb_id)
    @movie.load_attributes_from_tmdb_data(tmdb_data)
    if @movie.save
      flash[:success] = "Loaded fields from TMDB"
    else
      flash[:error] = "Could not load fields from TMDB"
    end
    respond_with @movie
  end
end
