class Api::V1::BookSearchController < ApplicationController

  def index
    book_search = BookSearchFacade.search(params[:location], params[:quantity])
    render(json: BookSearchSerializer.new(book_search))

  end
end