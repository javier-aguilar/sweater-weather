class Forecast
  attr_reader :location, :info, :id

  def initialize(location, info)
    @location = location
    @info = info
    @id = 1
  end

  def self.get_info(location)
    response = ForecastService.new.forecast_info(location)
    Forecast.new(location.title, response)
  end

  def current
    # @info[:current].inject({}) do |result, (key, value)|
    #   result[:location] = @location
    #   if key == :dt
    #     result[:current_time] = Time.at(value).strftime("%-I:%M %p, %b %d")
    #   elsif key == :sunrise || key == :sunset
    #     result[key] = Time.at(value).strftime("%-I:%M %p")
    #   elsif key == :feels_like || key == :uvi || key == :weather
    #     result[key] = value
    #   elsif key == :humidity
    #     result[key] = "#{value}%"
    #   elsif key == :visibility
    #     result[key] = "#{value} miles"
    #   end
    #   result
    # end
    @info[:current]
  end

  def hourly
    @info[:hourly]
  end

  def daily
    @info[:daily]
  end
end
