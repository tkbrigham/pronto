class Scraper
  PRONTO_URL = 'https://secure.prontocycleshare.com/data/stations.json'
  def initialize(url = PRONTO_URL)
    @url = url
  end

  def download(filename = default_file)
    File.open("tmp/#{filename}", 'w') do |f|
      f << get_response.body + "\n"
      return f.path
    end
  end

  private

  def default_file
    time = Time.now.to_s.gsub(' ', '_')
    "pronto_scrape_#{time}.txt"
  end

  def get_response
    Net::HTTP.get_response(URI(@url))
  end
end
