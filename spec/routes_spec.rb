describe Routes do

  context 'can be found by origin, destination and max stops' do
    it 'with no connections' do
      routes = Routes.new 'ab1 bc2'
      routes.find_by_max_stops('a', 'b').length.should eq(1)
    end

  #   it 'with connections and same origin and destination and a max of 6 stops' do
  #     routes = Routes.new 'ab1 bc2 ca3'
  #     found = routes.find_by_max_stops('a', 'a', 6).length.should eq(2)
  #   end

  #   it 'with connections and different origin and destination' do
  #     routes = Routes.new 'ab1 bc2 cd3'
  #     routes.find_by_max_stops('a', 'd').length.should eq(1)
  #   end

  #   it 'should find NO SUCH ROUTE with invalid origin' do
  #     routes = Routes.new 'ab1 bc2 cd3'
  #     routes.find_by_max_stops(nil, 'd')[0].to_s.should eq('NO SUCH ROUTE')
  #   end

  #   it 'should find NO SUCH ROUTE with invalid destination' do
  #     routes = Routes.new 'ab1 bc2 cd3'
  #     routes.find_by_max_stops('a', nil)[0].to_s.should eq('NO SUCH ROUTE')
  #   end

  # end

  # context 'can be found by origin, destination and exact stops' do
  #   it 'with no connections' do
  #     routes = Routes.new 'ab1 bc2'
  #     routes.find_by_number_of_stops('a', 'b').length.should eq(1)
  #   end

  #   it 'with connections and same origin and destination and exactly 6 stops' do
  #     routes = Routes.new 'ab1 bc2 ca3'
  #     found = routes.find_by_number_of_stops('a', 'a', 6).length.should eq(1)
  #   end

  #   it 'should find NO SUCH ROUTE with invalid destination' do
  #     routes = Routes.new 'ab1 bc2 cd3'
  #     routes.find_by_number_of_stops('a', nil)[0].to_s.should eq('NO SUCH ROUTE')
  #   end

  # end

  # context 'can be found by the shortest of a route for origin and destination' do
  #   it 'with multiple possible routes' do
  #     routes = Routes.new 'ab1 bc4 bd1 dc1'
  #     found = routes.find_by_shortest_route('a', 'c').to_s.should eq('abdc3')
  #   end

  #   it 'should find NO SUCH ROUTE with invalid origin' do
  #     routes = Routes.new 'ab1 bc2 cd3'
  #     routes.find_by_number_of_stops(nil, nil)[0].to_s.should eq('NO SUCH ROUTE')
  #   end
  # end

  # context 'can be found by a max distance of a route for origin and destination' do
  #   it 'with multiple possible routes' do
  #     routes = Routes.new 'ab1 bc4 bd1 dc1'
  #     found = routes.find_by_distance_less_than('a', 'c', 6).length.should eq(2)
  #   end

  #   it 'should find NO SUCH ROUTE with invalid origin' do
  #     routes = Routes.new 'ab1 bc2 cd3'
  #     routes.find_by_distance_less_than(nil, nil, 3)[0].to_s.should eq('NO SUCH ROUTE')
  #   end
  # end

  # context 'when desired route does not exists' do
  #   it 'should find NO SUCH ROUTE with single connection' do
  #     routes = Routes.new ''
  #     routes.find_by_exact_stops('a', 'b').to_s.should eq('NO SUCH ROUTE')
  #   end

  #   it 'should find NO SUCH ROUTE with two connections' do
  #     routes = Routes.new 'ab5 bc4'
  #     routes.find_by_exact_stops('a', 'b', 'd').to_s.should eq('NO SUCH ROUTE')
  #   end

  #   it 'should find NO SUCH ROUTE with no cities requested' do
  #     routes = Routes.new 'ab5 bc4'
  #     routes.find_by_exact_stops().to_s.should eq('NO SUCH ROUTE')
  #   end

  #   it 'should find NO SUCH ROUTE with no cities requested' do
  #     routes = Routes.new 'ab5 bc4'
  #     routes.find_by_exact_stops('a').to_s.should eq('NO SUCH ROUTE')
  #   end
  # end

  # context 'when desired route exists' do
  #   it 'find a route with no connections' do
  #     routes = Routes.new 'ab5'
  #     routes.find_by_exact_stops('a','b').to_s.should eq('ab5')
  #   end

  #   it 'find a route with two connections' do
  #     routes = Routes.new 'ab5 bc4'
  #     routes.find_by_exact_stops('a','b','c').to_s.should eq('abc9')
  #   end

  #   it 'find a route with 5 connections' do
  #     routes = Routes.new 'ab5 bc4 ce3 ed7 da2'
  #     routes.find_by_exact_stops('a','b','c','e','d','a').to_s.should eq('abceda21')
  #   end
  end

end