desc "Scrapes and parses Pronto API"
task :snp => :environment do
  Scraper.new.download
  Parser.new.parse
end
