module BorrowersHelper

  def popover_content(movies)
    content_tag :ul do
      movies.map do |movie|
        content_tag(:li, movie)
      end.join
    end
  end

end
