class Api::V1::RoadTripController < ApplicationController

  def create
    params[:api_key] = JSON.parse(request.raw_post)["api_key"]
    params[:origin] = JSON.parse(request.raw_post)["origin"]
    params[:destination] = JSON.parse(request.raw_post)["destination"]
    user = User.find_by(api_key: params[:api_key])
    if user.present?
      road_trip = RoadTripFacade.new_road_trip(params[:origin], params[:destination])
      render json: RoadTripSerializer.new(road_trip)
    else
      render json: { status: 401, message: "No Access - bad API key" }, status: 401
    end
  end
end