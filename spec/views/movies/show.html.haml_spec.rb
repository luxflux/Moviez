require 'spec_helper'

describe "movies/show.html.haml" do

  let(:user) { FactoryGirl.create(:user) }
  let(:movie) { FactoryGirl.create(:movie, user: user) }

  before do
    assign(:movie, MovieDecorator.decorate(movie))
  end

  subject { rendered }

  context 'as anonymous user' do
    before { render }
    it { should_not have_css('.form-actions>a') }
    it { should have_css("img.img-polaroid") }
  end

  context 'as the owner' do
    before do
      sign_in :user, user
      render
    end

    it { should have_css('.form-actions>a') }
  end
end

