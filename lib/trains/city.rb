# Contains multiple City objects that routes can be built towards. Follows Composite design pattern
class City
	attr_reader :name

	def initialize(name)
		@name, @destinations = name, {}
	end

	def route(city_names)
		return RouteEnd.new if city_names.nil? || city_names.empty?
		destination = @destinations[city_names[0]]
		return NO_ROUTE if destination.nil?
		connecting_city_names = city_names.slice(1, city_names.length)
		build_route_to(destination).connect_to(connecting_city_names)
	end

	def all_routes_to(end_of_route, maximum_stops=20, stops=0)
		routes = []
		return routes if stops == maximum_stops
		routes.concat(build_direct_route_to(end_of_route))
		routes.concat(build_connection_routes_to(end_of_route, maximum_stops, stops))
	end

	def build_connection_routes_to(end_of_route, maximum_stops, stops)
		connected_routes = []
		@destinations.each_value do |dest|
			dest.city.all_routes_to(end_of_route, maximum_stops, stops + 1).each do |connection|
				connected_routes << build_route_to(dest).connect(connection)
			end
		end
		connected_routes
	end

	def build_direct_route_to(end_of_route)
		direct_route = route(end_of_route.name)
		return [] if direct_route == NO_ROUTE
		[direct_route]
	end

	def build_route_to(destination)
		Route.new(self, destination.city, destination.distance)
	end

	def add_destination(destination)
		@destinations[destination.city.name] = destination
	end

	def empty?
		@name.empty?
	end

	def to_s
		@name
	end
end