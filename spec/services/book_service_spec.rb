require 'rails_helper'
RSpec.describe "book service", :vcr do
  xit "gets info for a book title containing search params" do
    search_param = "denver, co"
    limit = "5"

    response = BookService.search(search_param, limit)
    expect(response[:docs].length).to eq(5)
  end
end