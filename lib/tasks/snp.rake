desc "Scrapes and parses Pronto API"
task :snp => :environment do
  time = Time.now.to_s.gsub(' ','_')
  filename = "pronto_scrape_#{time}.txt"
  Scraper.new.download(filename)
  Parser.new("tmp/#{filename}").parse
end
