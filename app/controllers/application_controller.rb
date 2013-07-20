class ApplicationController < ActionController::Base
  protect_from_forgery



  # Authentificate admin
  def authenticate_admin
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '123456'
    end
  end


end
