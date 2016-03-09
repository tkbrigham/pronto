class Scraper
  PRONTO_URL = 'https://secure.prontocycleshare.com/data/stations.json'
  def initialize(url = PRONTO_URL)
    @url = url
  end

  def get_response
    Net::HTTP.get_response(URI(@url))
  end

  def download(filename = "pronto_scrape.txt")
    File.open("tmp/#{filename}", 'w') do |f|
      f << get_response.body + "\n"
      return true
    end
  end
end
