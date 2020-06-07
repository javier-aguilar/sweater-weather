class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :location,
             :current,
             :hourly,
             :daily
end
