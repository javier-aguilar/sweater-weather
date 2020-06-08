class RestaurantService
  def get_info(location)
    params = { entity_type: 'zone',
               lat: location.lat,
               lon: location.lng,
               cuisines: 55,
               appid: ENV['ZOMATO_API_KEY'] }
    get_json('search', params)
  end

  private

  def get_json(url, params = nil)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://developers.zomato.com/api/v2.1/') do |conn|
      conn.adapter Faraday.default_adapter
    end
  end
end
