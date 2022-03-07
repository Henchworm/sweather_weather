class BookSearchFacade
  def self.search(location, limit)
    response = BookService.search(location, limit)
    BookSearch.new(response)
  end
end