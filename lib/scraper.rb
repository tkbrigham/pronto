class Scraper
  PRONTO_URL = 'https://secure.prontocycleshare.com/data/stations.json'
  def initialize(url = PRONTO_URL)
    @url = url
  end

  def get_response
    Net::HTTP.get_response(URI(@url))
  end

  def download
    File.open('tmp/pronto_scrape.txt', 'w') do |f|
      f << get_response.body
      f << "\n"
      f.close
      return true
    end
  end
end
