class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # http_basic_authenticate_with name: "admin", password: "admin"
  USERS = { ENV["ADMIN_ACCESS_USERNAME"] => ENV["ADMIN_ACCESS_PASSWORD"] }

  def authenticate
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end

end
