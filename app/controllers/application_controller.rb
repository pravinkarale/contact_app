class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  before_action :set_locale

  def route_not_found
    render 'error_pages/404.html', :layout => false, :status => :not_found
  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale.to_sym : nil
  end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

end
