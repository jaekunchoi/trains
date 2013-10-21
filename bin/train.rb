require_relative '../lib/trains.rb'

routes = Routes.new('AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7')

puts routes.exact_stops('A','B','C').distance
puts routes.exact_stops('A','D').distance
puts routes.exact_stops('A','D','C').distance
puts routes.exact_stops('A','E','B','C','D').distance
puts routes.exact_stops('A','E','D')
puts routes.maximum_stops('C', 'C', 3).length
puts routes.number_of_stops('A', 'C', 4).length
puts routes.shortest_route('A', 'C').distance
puts routes.shortest_route('B', 'B').distance
puts routes.distance_less_than('C', 'C', 30).length