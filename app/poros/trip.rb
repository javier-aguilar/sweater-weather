class Trip
  attr_reader :id, :origin, :destination, :travel_time

  def initialize(info)
    @id = ""
    @origin = info[:origin]
    @destination = info[:destination]
    @travel_time = info[:travel_time]
  end

  def self.info(origin, destination)
    travel_info = GoogleService.new.travel_time(origin, destination)
    return if travel_info.key? :error_message

    info = { origin: origin,
             destination: destination,
             travel_time: travel_info[:routes][0][:legs][0][:duration][:text] }
    Trip.new(info)
  end

  def arrival_forecast
    destination_coordinates = Location.info(@destination)
    response = ForecastService.new.forecast_info(destination_coordinates)
    { summary: response[:current][:weather][0][:main],
      temperature: response[:current][:temp].to_i }
  end

end
