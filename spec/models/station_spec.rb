require 'rails_helper'

RSpec.describe Station, type: :model do
  it "validates unique attributes" do
    Station.create!(pronto_id: 66)
    expect{ Station.create!(pronto_id: 66) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
