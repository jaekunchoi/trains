require 'lib/trains'

describe Route do

	let(:route) { Route.new('A', 'B', 5) }

	subject { route }

	context 'without any connections' do
		it 'should return its name' do
			expect(route.str).to eq('AB5')
		end
	end

end

