module ApplicationHelper

  def nav_link(link_text, link_path, controllers, actions)
    class_name = controller?(*controllers) && action?(*actions) ? 'active' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

  def controller?(*controllers)
    Rails.logger.info controllers
    Rails.logger.info params[:controller]
    controllers.include?(params[:controller].to_sym)
  end

  def action?(*actions)
    Rails.logger.info actions
    Rails.logger.info params[:action]
    actions.include?(params[:action].to_sym)
  end

end
