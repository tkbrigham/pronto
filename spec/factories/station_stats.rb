FactoryGirl.define do
  factory :station_stat do
    pronto_id 1
    status 1
    blocked false
    suspended false
    out_of_service false
    has_key_dispenser false
    has_keys_available false
    latest_update "2016-03-08 14:06:23"
    latest_communication "2016-03-08 14:06:23"
    docks_available 1
    docks_unavailable 1
    bikes_available 1
    bikes_unavailable 1
    station nil
  end
end
