require 'spec_helper'

describe "movies/new.html.haml" do
  before do
    assign(:movie, stub_model(Movie))
  end

  it 'includes the tmdb_movie form' do
    render
  end
end

