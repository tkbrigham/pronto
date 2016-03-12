require 'rails_helper'

RSpec.describe StationSummary, type: :model do
  let(:summary) { build(:station_summary) }

  it "should respond to associations" do
    expect(summary).to respond_to(:station, :stats)
  end

  it "validates presence of Station" do
    expect{ StationSummary.create! }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
