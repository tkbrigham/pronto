class Scraper
  def initialize(url)
    @url = url
  end

  def get_response
    Net::HTTP.get_response(URI(@url))
  end
end
