#!/usr/bin/env ruby

class Street
  attr_accessor :i_start, :i_end, :name, :len

  def initialize(i_start, i_end, name, len)
    @i_start = i_start
    @i_end = i_end
    @name = name
    @len = len
  end
end

class CarPath
  attr_accessor :nb_streets, :streets

  def initialize(nb_streets, *streets)
    @nb_streets = nb_streets
    @streets = streets
  end
end

duration, nb_intersections, nb_streets, nb_cars, points_per_car = gets.split.map(&:to_i)

streets = []
nb_streets.times do
  streets += [Street.new(gets.split)]
end

car_paths = []
nb_cars.times do
  car_paths += [CarPath.new(gets.split)]
end