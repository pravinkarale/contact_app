class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def route_not_found
    render 'error_pages/404.html', :layout => false, :status => :not_found
  end
end
