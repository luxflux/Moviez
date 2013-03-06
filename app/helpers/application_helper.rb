module ApplicationHelper

  def current_path?(path)
    request.env['PATH_INFO'] == path
  end

  def class_for_path(path)
    if current_path?(path)
      :active
    else
      ''
    end
  end

  def navigation_link(path, icon, link_options = {})
    content_tag(:li, link_to(content_tag(:i, '', class: "icon-#{icon}"), path, link_options), class: class_for_path(path))
  end

end
