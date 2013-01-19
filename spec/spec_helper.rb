# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'factory_girl'
require 'factory_girl_rails'
require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/poltergeist'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

Capybara.javascript_driver = :poltergeist

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = true

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
end

def tmdb_result
  OpenStruct.new(
    id: 1,
    imdb_id: 't123',
    release_date: '01-01-1988',
    title: 'Star Wars Episode VII',
    tagline: 'Not so much words',
    overview: 'A lot more words!',
    runtime: 144,

    posters: [
      OpenStruct.new(
        sizes: OpenStruct.new(
          w154: OpenStruct.new(url: 'nice_pic.png')
        )
      )
    ],

    cast: [
      OpenStruct.new(
        id: 524,
        name: 'Natalie Portman',
        character: 'Queen Amidala',
        order: 0,
        cast_id: 6,
        profile_path: '/cWHfFaRj82mkl1Hqi2qrZn3VqEi.jpg'
      ),
        OpenStruct.new(
          id: 3061,
          name: 'Ewan McGregor',
          character: 'Obi Wan Kenobi',
          order: 1,
          cast_id: 7,
          profile_path: '/jL2FaPXJVe271LKYaj3ddFTeQ5O.jpg'
      )
    ],

    spoken_languages: [
      OpenStruct.new(name: 'English'),
      OpenStruct.new(name: 'German'),
      OpenStruct.new(name: 'Spanish')
    ],

    genres: [
      OpenStruct.new(name: 'Science-Fiction'),
      OpenStruct.new(name: 'Action')
    ]
  )
end
