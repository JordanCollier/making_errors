class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  class AccessDenied < StandardError; end

  rescue_from AccessDenied, with: :record_not_found

  private

    def record_not_found
      render file: "/public/over_capacity.html", status: 404
    end
end
