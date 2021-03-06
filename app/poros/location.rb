class Location
  attr_reader :title, :lat, :lng

  def initialize(info)
    @title = info[:title]
    @lat = info[:lat]
    @lng = info[:lng]
  end

  def self.info(location)
    response = GoogleService.new.geocode_info(location)
    return if response[:results].empty?

    location_info = response[:results].first
    info = { title: location_info[:formatted_address],
             lat: location_info[:geometry][:location][:lat],
             lng: location_info[:geometry][:location][:lng] }
    Location.new(info)
  end
end
