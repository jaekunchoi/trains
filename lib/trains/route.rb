class Route
	attr_reader :destination

	def initialize(origin = nil, destination = nil, distance = 0)
		@origin, @destination, @distance, @attachment = origin, destination, distance, NoRoute.new
	end

	def link(route)
		@attachment = route
		self
	end

	def link_to(city)
		attachment = @destination.route(city)
		return attachment if attachment == NO_ROUTE
		link(attachment)
	end

	def edge_name
		attachment + distance.to_s
	end

	def destination
		if @attachment.destination.empty?
			@destination.to_s
		else
			''
		end
	end

	def attachment
		@origin.to_s + destination + @attachment.attachment
	end

	def distance
		@distance + @attachment.distance
	end

	def stops
		@attachment.stops + 1
	end
end