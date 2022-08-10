class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  
  before_action :authorize_request
  attr_accessor :current_user

  private 

  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end
