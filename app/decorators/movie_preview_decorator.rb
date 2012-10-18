class MoviePreviewDecorator < Draper::Base

  allows :id, :title, :tagline, :overview, :release_date, :imdb_id

  def year
    Date.parse(release_date).year rescue 'unknown'
  end

  def cover_url
    model.posters.first.sizes.w154.url
  end

  def length
    model.runtime
  end

  def languages
    model.spoken_languages.collect { |lang| lang.name }.to_sentence
  end

  def genres
    model.genres.collect { |genre| genre.name }.to_sentence
  end

  def cast
    model.cast[0..3].collect { |cast| "#{cast.name} (#{cast.character})" }.to_sentence
  end

  def as_json(options = {})
    {
      id: id,
      title: title,
      tagline: tagline,
      overview: overview,
      year: year,
      cover_url: cover_url,
      length: length,
      languages: languages,
      genres: genres,
      cast: cast,
      imdb_id: imdb_id
    }
  end

  # Accessing Helpers
  #   You can access any helper via a proxy
  #
  #   Normal Usage: helpers.number_to_currency(2)
  #   Abbreviated : h.number_to_currency(2)
  #
  #   Or, optionally enable "lazy helpers" by including this module:
  #     include Draper::LazyHelpers
  #   Then use the helpers with no proxy:
  #     number_to_currency(2)

  # Defining an Interface
  #   Control access to the wrapped subject's methods using one of the following:
  #
  #   To allow only the listed methods (whitelist):
  #     allows :method1, :method2
  #
  #   To allow everything except the listed methods (blacklist):
  #     denies :method1, :method2

  # Presentation Methods
  #   Define your own instance methods, even overriding accessors
  #   generated by ActiveRecord:
  #
  #   def created_at
  #     h.content_tag :span, attributes["created_at"].strftime("%a %m/%d/%y"),
  #                   :class => 'timestamp'
  #   end
end
