class BackgroundSerializer
  include JSONAPI::Serializer

  set_id :id
  set_type "background"

  attributes :description, :location, :url, :credits
end