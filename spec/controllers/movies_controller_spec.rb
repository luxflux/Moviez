require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe MoviesController do

  # This should return the minimal set of attributes required to create a valid
  # Movie. As you add validations to Movie, be sure to
  # update the return value of this method accordingly.
  let(:valid_attributes) { FactoryGirl.attributes_for(:movie) }

  describe "GET index" do
    it "assigns all movies as @movies" do
      movie = Movie.create! valid_attributes
      get :index, {}
      assigns(:movies).should eq([movie])
    end
  end

  describe "GET show" do
    it "assigns the requested movie as @movie" do
      movie = Movie.create! valid_attributes
      get :show, {:id => movie.to_param}
      assigns(:movie).should eq(movie)
    end
  end

  context 'as owner of movies' do
    let(:owner) { FactoryGirl.create(:owner) }

    before do
      sign_in :owner, owner
    end

    describe "GET new" do
      it "assigns a new movie as @movie" do
        get :new, {}
        assigns(:movie).should be_a_new(Movie)
      end
    end

    describe "GET edit" do
      it "assigns the requested movie as @movie" do
        movie = FactoryGirl.create(:movie, owner: owner)
        get :edit, {:id => movie.to_param}
        assigns(:movie).should eq(movie)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Movie" do
          TMDB::Movie.should_receive(:find_by_id).and_return(tmdb_result)
          expect {
            post :create, {:movie => {:tmdb_id => 1337}}
          }.to change(Movie, :count).by(1)
        end

        it "assigns a newly created movie as @movie" do
          TMDB::Movie.should_receive(:find_by_id).and_return(tmdb_result)
          post :create, {:movie => valid_attributes}
          assigns(:movie).should be_a(Movie)
          assigns(:movie).should be_persisted
        end

        it "redirects to the created movie" do
          TMDB::Movie.should_receive(:find_by_id).and_return(tmdb_result)
          post :create, {:movie => valid_attributes}
          response.should redirect_to(Movie.last)
        end
      end

      describe "with invalid params" do
        let(:invalid_tmdb_result) do
          result = tmdb_result
          result.overview = nil
          result
        end
        it "assigns a newly created but unsaved movie as @movie" do
          TMDB::Movie.stub(:find_by_id).and_return(invalid_tmdb_result)
          post :create, {:movie => {}}
          assigns(:movie).should be_a_new(Movie)
        end

        it "re-renders the 'new' template" do
          TMDB::Movie.stub(:find_by_id).and_return(invalid_tmdb_result)
          post :create, {:movie => {}}
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do

      let(:movie) { FactoryGirl.create(:movie, owner: owner) }

      describe "with valid params" do
        it "updates the requested movie" do
          Movie.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, {:id => movie.to_param, :movie => {'these' => 'params'}}
        end

        it "assigns the requested movie as @movie" do
          put :update, {:id => movie.to_param, :movie => valid_attributes}
          assigns(:movie).should eq(movie)
        end

        it "redirects to the movie" do
          put :update, {:id => movie.to_param, :movie => valid_attributes}
          response.should redirect_to(movie)
        end
      end

      describe "with invalid params" do
        it "assigns the movie as @movie" do
          put :update, {:id => movie.to_param, :movie => {overview: nil}}
          assigns(:movie).should eq(movie)
        end

        it "re-renders the 'edit' template" do
          put :update, {:id => movie.to_param, :movie => {overview: nil}}
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      let(:movie) { FactoryGirl.create(:movie, owner: owner) }

      it "destroys the requested movie" do
        # create a movie
        movie
        expect {
          delete :destroy, {:id => movie.id}
        }.to change(Movie, :count).by(-1)
      end

      it "redirects to the movies list" do
        delete :destroy, {:id => movie.id}
        response.should redirect_to(movies_url)
      end
    end

    describe "PUT auto_update" do
      let(:movie) { FactoryGirl.create(:movie, owner: owner) }

      it 'updates the given movie with the data from tmdb' do
        TMDB::Movie.should_receive(:find_by_id).with(movie.tmdb_id).and_return(tmdb_result)
        expect {
          put :auto_update, {id: movie.id}
        }.to change { movie.reload.tagline }
      end

      context "as html" do
        it 'redirects to the movie' do
          TMDB::Movie.should_receive(:find_by_id).with(movie.tmdb_id).and_return(tmdb_result)
          put :auto_update, {id: movie.id}
          response.should redirect_to movie_path(movie)
        end
      end

      context "as json" do
        it 'renders success' do
          TMDB::Movie.should_receive(:find_by_id).with(movie.tmdb_id).and_return(tmdb_result)
          put :auto_update, {id: movie.id, format: :json}
          response.should be_success
        end
      end
    end
  end

end
