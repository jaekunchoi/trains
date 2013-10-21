# For connecting routes between cities
class Route
	attr_reader :destination

	def initialize(origin = nil, destination = nil, distance = 0)
		@origin, @destination, @distance, @connection = origin, destination, distance, RouteEnd.new
	end

	def stops
		1 + @connection.stops
	end

	def destination_to_str
		if @connection.destination.empty?
			@destination.to_s
		else
			''
		end
	end

	def connection_to_str
		@origin.to_s + destination_to_str + @connection.connection_to_str
	end

	def distance
		@distance + @connection.distance
	end

	def to_s
		connection_to_str + distance.to_s
	end

	def connect(route)
		@connection = route
		self
	end

	def connect_to(city_names)
		connection = @destination.route(city_names)
		return connection if connection == NO_ROUTE
		connect(connection)
	end
end