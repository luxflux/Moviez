class WelcomeController < ApplicationController
  def home
    render layout: true, nothing: true
  end
end
