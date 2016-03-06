class Parser
  DEFAULT_FILE = 'tmp/pronto_text.txt'

  def initialize(file = DEFAULT_FILE)
    @file = file
  end

  def parse_to_hash
    File.open('tmp/pronto_scrape.txt', 'r') do |f|
      JSON.parse(f.read)
    end
  end
end
