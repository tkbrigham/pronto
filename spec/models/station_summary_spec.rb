require 'rails_helper'

RSpec.describe StationSummary, type: :model do
  let(:summary) { build(:station_summary) }

  it "should respond to associations" do
    expect(summary).to respond_to(:station)
    expect(summary).to respond_to(:stats)
  end
end
