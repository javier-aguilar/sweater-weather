class Travel
  attr_reader :id, :end_location, :travel_time

  def initialize(info)
    @id = ""
    @end_location = info[:end_location]
    @travel_time = info[:travel_time]
    @cuisine = info[:cuisine]
    @location = Location.info(@end_location)
  end

  def self.get_info(startpoint, endpoint, cuisine)
    travel_info = GoogleService.new.travel_time(startpoint, endpoint)
    info = { end_location: endpoint,
             travel_time: travel_info[:routes][0][:legs][0][:duration][:text],
             cuisine: cuisine }
    Travel.new(info)
  end

  def forecast
    response = ForecastService.new.forecast_info(@location)
    { summary: response[:current][:weather][0][:main],
      temperature: response[:current][:temp].to_i }
  end

  def restaurant
    restaurant_info = RestaurantService.new.get_info(@location, cuisine_id)
    first_result = restaurant_info[:restaurants][0]
    { name: first_result[:restaurant][:name],
      address: first_result[:restaurant][:location][:address] }
  end

  private

  def cuisine_id
    cuisine_ids = RestaurantService.new.get_cuisines
    id = cuisine_ids[:cuisines].select do |key|
      key[:cuisine][:cuisine_name] == @cuisine.capitalize
    end
    id.first[:cuisine][:cuisine_id]
  end
end
