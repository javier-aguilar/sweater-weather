class Trip
  attr_reader :id, :origin, :destination, :travel_time

  def initialize(info)
    @id = ''
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
    dt = arrival_time.beginning_of_hour.to_i
    arrival = response[:hourly].select { |key| key[:dt] == dt }.first
    { summary: arrival[:weather][0][:main],
      temperature: arrival[:temp].to_i }
  end

  private

  def arrival_time
    time = @travel_time.scan(/\d+/).map(&:to_i)
    arrival = Time.zone.now
    if @travel_time.include? 'hour'
      arrival += time[0].hour if time[0]
      arrival += time[1].minutes if time[1]
    else
      arrival += time[0].minutes
    end
    arrival
  end
end
