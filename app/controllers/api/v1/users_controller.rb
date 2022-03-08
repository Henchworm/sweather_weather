class Api::V1::UsersController < ApplicationController

  def create
    params[:user] = JSON.parse(request.raw_post)
    user = User.new(user_params)
    if user.save
      render(json: UserSerializer.new(user), status: :created)
    else
      render json: { status: 400, message: "#{user.errors.full_messages.to_sentence}", data: user.errors}, status: :bad_request
    end
  end

  private
  def user_params
    params[:user].permit(:email, :password, :password_confirmation)
  end
end