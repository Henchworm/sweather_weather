class BookForecastSearchSerializer
  include JSONAPI::Serializer
  set_id :id
  set_type "books"

  attributes :forecast, :total_books_found, :books
end
