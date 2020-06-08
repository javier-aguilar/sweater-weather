class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :current,
             :details,
             :hourly,
             :daily
end
