FactoryGirl.define do
  factory :station_stat, aliases: [:last_stat] do
    timestamp nil
    status 1
    blocked false
    suspended false
    out_of_service false
    has_key_dispenser false
    has_keys_available false
    latest_update "2016-03-08 14:06:23"
    latest_communication "2016-03-08 14:06:23"
    docks_a 1
    docks_u 1
    bikes_a 1
    bikes_u 1
    station
  end
end
