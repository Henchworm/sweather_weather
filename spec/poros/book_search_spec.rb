require 'rails_helper'
RSpec.describe BookSearch do
  it "creates a booksearch object from JSON data", :vcr do
    response = Faraday.get("http://openlibrary.org/search.json?q=denver,co&limit=5&details=true")
    data = JSON.parse(response.body, symbolize_names: true)

    book_search_1 = BookSearch.new(data)
    expect(book_search_1).to be_a(BookSearch)
    expect(book_search_1.books).to be_an(Array)
    book_search_1.books.each do |book|
      expect(book).to have_key(:isbn)
      expect(book).to have_key(:title)
      expect(book).to have_key(:publisher)
    end
  end
end