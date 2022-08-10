class UsersController < ApplicationController
    skip_before_action :authorize_request, only: :create

  def create 
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    json_response({ auth_token: auth_token, message: 'Account created successfully' }, :created)
  end


  private 

  def user_params 
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
