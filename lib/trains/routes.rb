# Scans route graph data input. Performs search and filtering operations with various methods
class Routes
    def initialize(route_data)
        @cities = {}
        route_data.scan(/\w{2}\d/) do |route|
            origin, destination, distance = route[0], route[1], route[2].to_i
            search_for_city(origin).add_destination(Destination.new(search_for_city(destination),distance))
        end
    end

    def search_for_city(name)
        @cities[name] = City.new(name) if !@cities.has_key?(name)
        @cities[name]
    end

    def maximum_stops(origin, destination, maximum_stops=20)
        no_route(origin, destination) do
            origin_city, destination_city = search_for_city(origin), search_for_city(destination)
            origin_city.all_routes_to(destination_city, maximum_stops)
        end
    end

    def shortest_route(origin, destination)
        maximum_stops(origin, destination).min do |route_a, route_b|
            route_a.distance <=> route_b.distance
        end
    end

    def number_of_stops(origin, destination, number_of_stops=1)
        no_route(origin, destination) do
            maximum_stops(origin, destination, number_of_stops).select do |route|
                route.stops == number_of_stops
            end
        end
    end

    def exact_stops(*args)
        args_length = args.length
        return NO_ROUTE if args_length < 2
        origin = search_for_city(args[0])
        origin.route(args.slice(1, args_length))
    end

    def distance_less_than(origin, destination, maximun_distance)
        maximum_stops(origin, destination).select do |route|
            route.distance < maximun_distance
        end
    end

    def no_route(origin, destination)
        return [NO_ROUTE] if origin == nil || destination == nil
        yield
    end
end