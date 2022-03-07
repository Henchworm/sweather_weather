class BookSearchSerializer
  include JSONAPI::Serializer
  set_id :id
  set_type "books"

  attributes :total_books_found, :books
end
