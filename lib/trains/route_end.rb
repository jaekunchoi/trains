# RouteEnd object to process and output all the methods of NoRoute except name to indicate end of the route
class RouteEnd < NoRoute
	def name
		''
	end
end