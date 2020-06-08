class Travel
  attr_reader :end_location, :duration

  def initialize(info)
    @end_location = info[:end_location]
    @duration = info[:duration]
  end

  def self.get_info(startpoint, endpoint)
    travel_info = GoogleService.new.travel_time(startpoint, endpoint)
    info = { end_location: endpoint,
             duration: travel_info[:routes][0][:legs][0][:duration][:text] }
    Travel.new(info)
  end

  def forecast
    # return summary and temperature
  end

  def restaurant
    # return restaurant name and address
  end
end
