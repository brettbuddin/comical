# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def page_id
    "#{the_controller}-#{the_action}".gsub(/_/, '-')
  end
  
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def the_controller
    controller.class.to_s.underscore.gsub(/_controller$/, '')
  end
  
  def the_action
    controller.action_name.underscore
  end
end
