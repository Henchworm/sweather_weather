class BookSearch
  attr_reader :total_books_found,
              :books

  def initialize(data)
    @total_books_found = data[:numFound]
    @books = books_formatter(data[:docs])
  end

  def books_formatter(docs)
    docs.map do |book|
      {
        isbn: book[:isbn],
        title: book[:title],
        publisher: book[:publisher]
      }
    end
  end
end