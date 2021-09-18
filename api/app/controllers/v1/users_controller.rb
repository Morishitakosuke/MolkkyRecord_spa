class V1::UsersController < ApplicationController
  before_action :authenticate_api_user!, only: %i[update]
  before_action :set_user, only: %i[updates]

  def index
    render json: User.all.select(:id, :username, :profile, :image).limit(9).offset(params[:data_id])
  end

  def show
    render json: User.select(:id, :username, :profile, :image).find(params[:id])
  end

  def update
    if @user.id == current_api_user.id && @user.update_attributes(user_params)
      head :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # ログインユーザーを返す
  def current
    render json: User.select(:id, :username, :email, :profile, :image).find(current_api_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:image, :profile)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
