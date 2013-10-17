class Routes

    def initialize(route_data)
        @cities = {}
        route_data.scan(/[a-zA-Z]{2}\d/) do |route|
            origin, destination, distance = route[0], route[1], route[2].to_i
            search_city(origin).add_destination(Destination.new(search_city(destination), distance))
        end
    end

    def search_city(city_name)
        @cities[city_name] = City.new(city_name) if !@cities.has_key?(city_name)
        @cities[city_name]
    end

    def find_by_exact_stops(*args)
        return NO_ROUTE if args.length < 2
        origin = search_city(args[0])
        origin.route(args.slice(1,args.length))
    end

    def find_by_number_of_stops(origin, destination, number_of_stops=1)
        no_route(origin, destination) do
            find_by_max_stops(origin, destination, number_of_stops).select do |route|
                route.stops == number_of_stops
            end
        end
    end

    def find_by_max_stops(origin, destination, max_stops=15)
        no_route(origin, destination) do
            origin_city = search_city origin
            destination_city = search_city destination
            origin_city.get_all_routes destination_city, max_stops
        end
    end

    def find_by_shortest_route(origin, destination)
        find_by_max_stops(origin, destination).min { |route_a, route_b| route_a.distance <=> route_b.distance }
    end

    def find_by_distance_less_than(origin, destination, max_distance)
        find_by_max_stops(origin, destination).select { |route| route.distance < max_distance }
    end

    def no_route(origin, destination)
        return [NO_ROUTE] if origin == nil || destination == nil
        yield
    end

end