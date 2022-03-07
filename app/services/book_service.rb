class BookService

  def self.conn
    Faraday.new(url: 'http://openlibrary.org')
  end

  def self.search(location, limit)
    response = conn.get("/search.json?q=#{location}&limit=#{limit}&details=true")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end
