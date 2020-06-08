class ForecastService
  def forecast_info(location)
    params = { lat: location.lat,
               lon: location.lng,
               # units: 'imperial',
               exclude: 'minutely',
               appid: ENV['OWEATHER_API_KEY'] }
    get_json('onecall', params)
  end

  private

  def get_json(url, params = nil)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://api.openweathermap.org/data/2.5/') do |conn|
      conn.adapter Faraday.default_adapter
    end
  end
end
