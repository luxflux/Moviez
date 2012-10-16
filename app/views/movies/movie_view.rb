module Movies

  class MovieView < Poirot::View
    def title
      movie.title
    end

    def image
      'http://www.placehold.it/100x150'
    end

    def disc_number
      movie.disc_number
    end

    def watched
      movie.watched
    end

    def description
      movie.description
    end

    def url
      movie_path movie
    end

  end

end
