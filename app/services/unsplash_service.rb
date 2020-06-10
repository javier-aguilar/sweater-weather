class UnsplashService
  def search(query)
    params = { query: query,
               client_id: ENV['UNSPLASH_ACCESS_KEY'] }
    get_json('search/photos', params)
  end

  private

  def get_json(url, params = nil)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://api.unsplash.com/') do |conn|
      conn.adapter Faraday.default_adapter
    end
  end
end
