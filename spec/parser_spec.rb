require 'rails_helper'
require 'parser'

RSpec.describe Parser do
  before(:all) do
    @parser = Parser.new
  end

  describe "#parse_file" do
    it "reads from tmp/pronto_scrape.txt" do
      file = "tmp/pronto_scrape.txt"
      arg = 'r'

      expect(File).to receive(:open).with(file, arg).exactly(1).times
      @parser.parse_file
    end
  end
end
