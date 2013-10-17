class City
    attr_reader :city_name

    def initialize(city_name)
        @city_name, @destinations = city_name, {}
    end

    def add_destination(destination)
        @destinations[destination.city.city_name] = destination
    end

    def route(city)
        return NoRoute.new if city.empty?
        destination = @destinations[city]
        return NO_ROUTE if destination == nil
        cites = city.slice(1, city.length)
        create_route(destination).link(cites)
    end

    def get_all_routes(destination, maximum_stops = 15, stops = 0)
        routes = []
        return routes if stops == maximum_stops
        routes.concat(create_route_direct destination)
        routes.concat(create_link_routes destination, maximum_stops, stops)
    end

    def create_link_routes(destination, maximum_stops, stops)
        routes_being_linked = []
        @destinations.each_value do |dest|
            dest.city.get_all_routes(dest, maximum_stops, stops + 1).each do |attached|
                routes_being_linked << create_route(dest).link(attached)
            end
        end
    end

    def create_route_direct(destination)
        route = route(destination.city_name)
        return [] if route = NO_ROUTE
        [route]
    end

    def create_route(destination)
        Route.new(self, destination.city, destination.distance)
    end

    def city_name
        @city_name
    end

    def empty?
        @city_name.empty?
    end
end