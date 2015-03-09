class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
      User.find_by_id(session[:user_id])
    end

    def authenticate
      redirect_to login_path, :alert => 'You must be logged in to visit that page.' unless current_user
    end

    helper_method :current_user

  class NotLogged < StandardError; end
  rescue_from NotLogged, with: :nope

  class AccessDenied < StandardError; end
  rescue_from AccessDenied, with: :record_not_found

  private

    def nope
      render file: "/public/nope.html", status: 404
    end

    def record_not_found
      render file: "/public/over_capacity.html", status: 404
    end
end
