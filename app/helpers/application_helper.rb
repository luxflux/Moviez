module ApplicationHelper

  def current_path?(path)
    request.env['PATH_INFO'] == path
  end

end
