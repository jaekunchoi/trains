require_relative '../lib/trains'

describe Route do

	let(:route) { Route.new('A', 'B', 5) }

	subject { route }

	context "no attachments" do
		it "should return its edge name" do
			expect(route.edge_name).to eq('AB5')
		end

		it "should return the distance" do
			expect(route.distance).to eq(5)
		end

		it "should return stop" do
			expect(route.stops).to eq(1)
		end
	end

	context "attachment" do
		let(:route_one) { Route.new('A', 'B', 5) }
		let(:route_two) { Route.new('B', 'C', 4) }

		before(:each) do
			route_one.link(route_two)
		end

		it "returns its edge name" do
			expect(route_one.edge_name).to eq('ABC9')
		end

		it "should return two stops" do
			expect(route_one.stops).to eq(2)
		end

		it "returns distance between two routes" do
			expect(route_one.distance).to eq(9)
		end
	end

end

