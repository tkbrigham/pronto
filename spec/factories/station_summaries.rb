FactoryGirl.define do
  factory :station_summary do
    station
    timestamp 1
    tot_dock_a "9.99"
    tot_dock_u "9.99"
    tot_bike_a "9.99"
    tot_bike_u "9.99"
    samples 1
  end

  trait :ten_bikes do
    tot_bike_a 10
  end

  trait :two_samples do
    samples 2
  end
end
