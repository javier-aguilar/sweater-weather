class RestaurantService
  def get_info(location, cuisine_id)
    params = { entity_type: 'zone',
               lat: location.lat,
               lon: location.lng,
               cuisines: cuisine_id }
    get_json('search', params)
  end

  def cuisines
    params = { city_id: 1 }
    get_json('cuisines', params)
  end

  private

  def get_json(url, params = nil)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://developers.zomato.com/api/v2.1/') do |conn|
      conn.adapter Faraday.default_adapter
      conn.headers['user-key'] = ENV['ZOMATO_API_KEY']
    end
  end
end
