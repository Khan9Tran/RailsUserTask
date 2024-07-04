# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
  before_action :authenticate
  def authenticate
    begin
      token = request.headers["Authorization"].split(" ")[1]
      userId = Auth.decode(token)["user"]
      @user = User.find(userId)
    rescue
      render json: { error: "unauthorized" }, status: :unauthorized
    end
  end
end
