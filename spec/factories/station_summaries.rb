FactoryGirl.define do
  factory :station_summary do
    station
    time_of_day 1
    avg_dock_a "9.99"
    avg_dock_u "9.99"
    avg_bike_a "9.99"
    avg_bike_u "9.99"
    samples 1
    last_stat
  end
end
