class Forecast
  attr_reader :id, :location, :current, :hourly, :daily

  def initialize(location, info)
    @id = 1
    @location = location
    @current = info[:current]
    @hourly = info[:hourly]
    @daily = info[:daily]
  end

  def self.get_info(location)
    response = ForecastService.new.forecast_info(location)
    Forecast.new(location.title, response)
  end
end
