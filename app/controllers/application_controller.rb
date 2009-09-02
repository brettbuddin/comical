# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  def render_optional_error_file(status_code)
    if status_code == :not_found
      render_404
    else
      super
    end
  end
  
  def render_404
    respond_to do |type| 
      type.html { render :template => "errors/404", :status => 404 } 
      type.all  { render :nothing => true, :status => 404 } 
    end
    true
  end
end
