class Forecast
  attr_reader :id, :location, :info

  def initialize(location, info)
    @id = 1
    @location = location
    @info = info
  end

  def self.get_info(location)
    response = ForecastService.new.forecast_info(location)
    Forecast.new(location.title, response)
  end

  def current
    result = {}
    result[:location] = @location
    result[:current_time] = @info[:current][:dt]
    result[:image] = image_url(@info[:current][:weather].first[:icon])
    result[:description] = @info[:current][:weather].first[:main]
    result[:temp] = @info[:current][:temp]
    result[:high] = daily.first[:max]
    result[:low] = daily.first[:min]
    result
  end

  def details
    result = {}
    result[:feels_like] = @info[:current][:feels_like]
    result[:humidity] = @info[:current][:humidity]
    result[:visibility] = @info[:current][:visibility]
    result[:uv_index] = @info[:current][:uvi]
    result[:sunrise] = @info[:current][:sunrise]
    result[:sunset] = @info[:current][:sunset]
    result
  end

  def hourly
    @info[:hourly].each_with_object([]) do |hour, result|
      hash = {}
      hash[:hour] = hour[:dt]
      hash[:temp] = hour[:temp]
      hash[:image] = image_url(hour[:weather].first[:icon])
      result << hash
    end
  end

  def daily
    @info[:daily].each_with_object([]) do |day, result|
      hash = {}
      hash[:day] = day[:dt]
      hash[:image] = image_url(day[:weather].first[:icon])
      hash[:description] = day[:weather].first[:main]
      hash[:rain] = day[:rain]
      hash[:max] = day[:temp][:max]
      hash[:min] = day[:temp][:min]
      result << hash
    end
  end

  private

  def image_url(icon)
    "http://openweathermap.org/img/wn/#{icon}@2x.png"
  end
end
