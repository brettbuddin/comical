# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def page_id
    a = controller.class.to_s.underscore.gsub(/_controller$/, '')
    b = controller.action_name.underscore
    "#{a}-#{b}".gsub(/_/, '-')
  end
  
  def title(page_title)
    content_for(:title) { page_title }
  end
end
