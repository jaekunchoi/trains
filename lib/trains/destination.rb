class Destination
	attr_reader :city, :distance
	def initialize(city, distance)
		@city, @distance = city, distance
	end
end