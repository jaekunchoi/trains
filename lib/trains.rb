$LOAD_PATH << File.join(File.dirname(__FILE__), "trains")
require 'route'
require 'routes'
require 'no_route'
require 'route_end'
require	'city'
require 'destination'

NO_ROUTE = NoRoute.new