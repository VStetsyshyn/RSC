require 'yaml'
require_relative 'graph'

class MetroInfopoint
  def initialize(path_to_timing_file:, path_to_lines_file:)
    timing = YAML.load(File.read("config/timing2.yml"))["timing"]
    
    @arr_time = []
    timing.each do |num|
    @arr_time << num.slice("start", "end", "time").values
    end
    @time = Graph.new(@arr_time)

    @arr_price = []
    timing.each do |num|
    @arr_price << num.slice("start", "end", "price").values
    end
    @price = Graph.new(@arr_price)
  end    
    
  def calculate(from_station:, to_station:)
    { price: calculate_price(from_station: from_station, to_station: to_station),
      time: calculate_time(from_station: from_station, to_station: to_station) }
  end

  def calculate_price(from_station:, to_station:)
    @price.smallest_distance(from_station, to_station)
  end

  def calculate_time(from_station:, to_station:)
    @time.smallest_distance(from_station, to_station)
  end

end