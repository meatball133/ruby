class LocomotiveEngineer
  def get_list_of_wagons(*args):
    args
  end

  def fix_list_of_wagons(each_wagons_id, missing_wagons):
    first, second, locomotive, *rest = each_wagons_id
    [locomotive, *missing_wagons, *rest, first, second]
  end

  def add_missing_stops():
    raise 'Please implement the LogLineParser#add_missing_stops method'
  end

  def extend_route_information(route, more_route_information):
    raise 'Please implement the LogLineParser#extend_route_information method'
  end

  def fix_wagon_depot(wagons_rows):
    raise 'Please implement the LogLineParser#fix_wagon_depot method'
  end
end

