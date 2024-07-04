class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:register]
  def index
    @users = User.all
    render json: @users
  end

  def register
    find_user = User.find_by(username: user_params[:username])
    if find_user
      render json: { error: "Username already exists" }, status: :unauthorized
      return
    end

    @user = User.new(user_params)
    @user.confirmation_token = Auth.email_comfimation_token(@user.id)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end


  def update
    @user = User.find(params[:id])
    if @user && @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

  end
end
