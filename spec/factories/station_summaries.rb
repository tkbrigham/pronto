FactoryGirl.define do
  factory :station_summary do
    station
    timestamp 1
    avg_dock_a "9.99"
    avg_dock_u "9.99"
    avg_bike_a "9.99"
    avg_bike_u "9.99"
    samples 1
  end

  trait :avg_bike_of_ten do
    avg_dock_a '10.0'
  end

  trait :two_samples do
    samples 2
  end
end
