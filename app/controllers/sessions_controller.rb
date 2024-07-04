require 'auth'
class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:login]
  def login
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        jwt = Auth.issue({user: @user.id})
        render json: {jwt: jwt}
      else
        render json: { error: "Invalid username or password" }, status: :unauthorized
      end
  end
end
