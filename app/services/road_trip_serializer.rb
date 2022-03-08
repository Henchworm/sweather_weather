class RoadTripSerializer
  include JSONAPI::Serializer

  set_id :id
  set_type "roadtrip"

  attributes :start_city,
             :end_city,
             :travel_time,
             :arrival_weather

end