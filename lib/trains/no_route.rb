# Defaults to no route has been added. Uses Comparable to compare distances between two routes
class NoRoute
	include Comparable

	def connect
	end

	def <=>(other)
		self.to_s == other.to_s
	end

	def stops
		0
	end

	def destination
		''
	end

	def destination_to_str
		''
	end

	def connection_to_str
		''
	end

	def to_s
		'NO SUCH ROUTE'
	end

	def distance
		0
	end
end

NO_ROUTE = NoRoute.new