class Travel
  attr_reader :id, :end_location, :travel_time

  def initialize(info)
    @id = 1
    @end_location = info[:end_location]
    @travel_time = info[:travel_time]
    @location = Location.info(@end_location)
  end

  def self.get_info(startpoint, endpoint)
    travel_info = GoogleService.new.travel_time(startpoint, endpoint)
    info = { end_location: endpoint,
             travel_time: travel_info[:routes][0][:legs][0][:duration][:text] }
    Travel.new(info)
  end

  def forecast
    response = ForecastService.new.forecast_info(@location)
    { summary: response[:current][:temp].to_i,
      temperature: response[:current][:weather][0][:main] }
  end

  def restaurant
    restaurant_info = RestaurantService.new.get_info(@location)
    first_result = restaurant_info[:restaurants][0]
    { name: first_result[:restaurant][:name],
      address: first_result[:restaurant][:location][:address] }
  end
end
