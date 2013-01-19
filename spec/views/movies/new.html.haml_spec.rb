require 'spec_helper'

describe "movies/new.html.haml" do
  before do
    controller.stub(:controller_name).and_return('movies')
    assign(:movie, stub_model(Movie))
  end

  before { render }
  subject { rendered }

  it { should have_css("form > input#title") }
  it { should have_css("script#movie-preview-title-template") }
  it { should have_css("script#movie-preview-template") }
end

