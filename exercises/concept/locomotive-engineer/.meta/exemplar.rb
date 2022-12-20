class LocomotiveEngineer
  def self.get_array_of_wagons(*args)
    args
  end

  def self.fix_array_of_wagons(each_wagons_id, missing_wagons)
    first, second, locomotive, *rest = each_wagons_id
    locomotive, *missing_wagons, *rest, first, second
  end

  def self.add_missing_stops(route, **kwargs)
    {**route, stops: kwargs.values}
  end

  def self.extend_route_information(route, more_route_information)
    {**route, **more_route_information}
  end
end
