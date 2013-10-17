# Contains default values for outputs of each method. Behaviours in this class will drive other objects to stop attaching further routes
class NoRoute
	include Comparable

	def <=>(second)
		self.name == second.name
	end

	def name
		"NO SUCH ROUTE"
	end

	def attach(route)
	end

	def attachment
		''
	end

	def stops
		0
	end

	def destination
		''
	end

	def distance
		0
	end
end