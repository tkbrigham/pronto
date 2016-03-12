require 'rails_helper'

RSpec.describe StationStat, type: :model do
  let(:station) { create(:station) }

  it 'validates presence of station' do
    expect{ StationStat.create! }.to raise_error(ActiveRecord::RecordInvalid)
    expect{ StationStat.create!(station: station) }.not_to raise_error
  end

  it 'sets timestamp after create' do
    expect(build(:station_stat).timestamp).to be_nil
    expect(create(:station_stat).timestamp).to be_an(Integer)
  end
end
