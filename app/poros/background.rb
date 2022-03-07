class Background
  attr_reader :id,
              :description,
              :location,
              :credits,
              :url

  def initialize(data)
    #should be refactored to get rid of .first facade
    @id = nil
    @description = data[:results].first[:description]
    @url = data[:results].first[:urls][:raw]
    @location = data[:results].first[:tags].first[:title]

    @credits = credits_formatter(data[:results].first[:user][:username],
                                data[:results].first[:user][:portfolio_url],
                                data[:results].first[:links][:self])
  end

  def credits_formatter(username, portfolio_link, upsplash_link)
     {
        username: username,
        portfolio_link: portfolio_link,
        upsplash_link: upsplash_link
      }
  end
end