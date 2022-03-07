class UnsplashService

  def self.conn
    Faraday.new(url: 'https://api.unsplash.com') do |f|
      f.params['client_id'] = ENV['photo_key']
    end
  end

  def self.location_search(location)
    response = conn.get("/search/photos?page=1&query=#{location + "skyline"}")

    JSON.parse(response.body, symbolize_names: true)
  end
end