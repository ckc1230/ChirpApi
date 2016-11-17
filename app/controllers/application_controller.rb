class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_last_modified

  # authenticate_or_request_with_http_token

  def set_last_modified
  	headers['Last-Modified'] = Time.now.httpdate
  end
  
end
