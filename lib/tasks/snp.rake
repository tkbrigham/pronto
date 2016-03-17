desc "Scrapes and parses Pronto API"
task :snp => :environment do
  Scraper.new.download
  p = Parser.new
  p.parse
  updater = ProntoSummarizer.new(p.timestamp)
  updater.update
end
