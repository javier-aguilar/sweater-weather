class TripSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :origin,
             :destination,
             :travel_time,
             :arrival_forecast
end
