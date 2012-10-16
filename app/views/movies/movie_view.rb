module Movies

  class MovieView < Poirot::View
    def title
      movie.title
    end

    def image
      movie.image
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
      movie.url
    end

  end

end
