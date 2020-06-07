class GoogleService
  def geocode_info(address)
    params = { address: address,
               key: ENV['GOOGLE_API_KEY'] }
    get_json('geocode/json', params)
  end

  private

  def get_json(url, params = nil)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://maps.googleapis.com/maps/api/') do |conn|
      conn.adapter Faraday.default_adapter
    end
  end
end
