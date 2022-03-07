class BookSearchFacade
  def self.search(location, limit, forecast)
    response = BookService.search(location, limit)
    BookSearch.new(response)
  end
end