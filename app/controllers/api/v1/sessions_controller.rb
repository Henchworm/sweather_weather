class Api::V1::SessionsController < ApplicationController

  def create
    params[:email] = JSON.parse(request.raw_post)["email"]
    params[:password] =  JSON.parse(request.raw_post)["password"]
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
        session[:user_id] = user.id
        render json: UserSerializer.new(user)
    else
      render json: { status: 'ERROR', message: "Invalid username or password", data:{}}, status: :bad_request
    end
  end
end