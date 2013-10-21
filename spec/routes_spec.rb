describe Routes do

context 'search parameters origin destination and maximum stops' do
	it 'no connections' do
		routes = Routes.new('AB1 BC2')
		expect(routes.maximum_stops('A', 'B').length).to eq(1)
	end

	it 'same origin and destination and a maximum inputs' do
		routes = Routes.new('AB1 BC2 CA3')
		expect(routes.maximum_stops('A', 'A', 6).length).to eq(2)
	end

	let(:routes){ Routes.new('AB1 BC2 CD3') }
		it 'different origin and destination' do
		expect(routes.maximum_stops('A', 'D').length).to eq(1)
	end

	it 'invalid origin' do
		expect(routes.maximum_stops(nil, 'D')[0].to_s).to eq('NO SUCH ROUTE')
	end

	it 'invalid destination' do
		expect(routes.maximum_stops('A', nil)[0].to_s).to eq('NO SUCH ROUTE')
	end

end

context 'origin, destination and exact stops' do
	it 'invalid destination' do
		expect(routes.number_of_stops('A', nil)[0].to_s).to eq('NO SUCH ROUTE')
	end

	it 'no connections' do
		routes = Routes.new('AB1 BC2')
		expect(routes.number_of_stops('A', 'B').length).to eq(1)
	end

	let(:routes){ routes = Routes.new('AB1 BC2 CA3') }
	it 'same origin and destination and exactly 6 stops' do
		expect(routes.number_of_stops('A', 'A', 6).length).to eq(1)
	end
end

context 'can be found by the shortest of a route for origin and destination' do
	it 'multiple possible routes' do
	 routes = Routes.new('AB1 BC4 BD1 DC1')
	 expect(routes.shortest_route('A', 'C').to_s).to eq('ABDC3')
	end

	it 'invalid origin' do
		routes = Routes.new('AB1 BC2 CD3')
		expect(routes.number_of_stops(nil, nil)[0].to_s).to eq('NO SUCH ROUTE')
	end
end

context 'route exists' do
	it 'route with no connections' do
		routes = Routes.new('AB5')
		expect(routes.exact_stops('A','B').to_s).to eq('AB5')
	end

	it 'route with two connections' do
		routes = Routes.new('AB5 BC4')
		expect(routes.exact_stops('A','B','C').to_s).to eq('ABC9')
	end

	it '7 connections' do
		routes = Routes.new('AB5 BC4 CE3 ED7 DA2 AC4 CB6')
		expect(routes.exact_stops('A','B','C','E','D','A','C','B').to_s).to eq('ABCEDACB31')
	end
end

context 'search each route maximum distance between origin and destination' do
	it 'possible routes' do
		routes = Routes.new('AB1 BC4 BD1 DC1')
		expect(routes.distance_less_than('A', 'C', 6).length).to eq(2)
	end

	it 'invalid origin' do
		routes = Routes.new('AB1 BC2 CD3')
		expect(routes.distance_less_than(nil, nil, 3)[0].to_s).to eq('NO SUCH ROUTE')
	end
end

context 'invalid route' do
	it 'single connection' do
		routes = Routes.new('')
		expect(routes.exact_stops('A', 'B').to_s).to eq('NO SUCH ROUTE')
	end

	let(:routes){ routes = Routes.new('AB5 BC4') }
	it 'two connections' do
		expect(routes.exact_stops('A', 'B', 'D').to_s).to eq('NO SUCH ROUTE')
	end

	it 'no cities requested' do
		expect(routes.exact_stops().to_s).to eq('NO SUCH ROUTE')
	end

	it 'no cities requested' do
		expect(routes.exact_stops('A').to_s).to eq('NO SUCH ROUTE')
	end
end

end