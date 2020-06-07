class Background
  attr_reader :id, :url

  def initialize(info)
    @id = 1
    @url = info[:url]
  end

  def self.find(query)
    search_results = Unsplash::Photo.search(query)
    info = { url: search_results.first.urls.full }
    Background.new(info)
  end
end
