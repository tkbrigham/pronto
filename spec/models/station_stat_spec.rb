require 'rails_helper'

RSpec.describe StationStat, type: :model do
  let(:station) { create(:station) }

  it 'validates presence of station' do
    expect{ StationStat.create! }.to raise_error(ActiveRecord::RecordInvalid)
    expect{ StationStat.create!(station: station) }.not_to raise_error
  end

  it 'sets timestamp after save' do
    station_stat = build(:station_stat)
    expect(station_stat.timestamp).to be_nil
    station_stat.save
    expect(station_stat.timestamp).to be_an(Integer)
  end
end
