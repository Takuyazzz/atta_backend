class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user
  def index

  end

  def create
    user_params
  end

  def update
    begin
      user = User.find_by(sub: current_user.sub)
      user.update!(user_params)
      render json: { updated: true }
    rescue => e 
      render json: { updated: false, error: e }
    end
  end

  private
  # def receiveBody
  #   JSON.parse(request.body.read, {:symbolize_names => true})
  # end

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
