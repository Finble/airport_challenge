require 'airport'

describe Airport do

	subject(:airport) {described_class.new(weather, 20)}  # subject = new class of described class, which is Airport
	let(:plane) {double (:plane)}  #declare variable at top of tests, vs within each test
	let(:weather) {double (:weather)}

	describe '#land' do

		context 'when not stormy' do

			before do 
				allow(weather).to receive(:stormy?).and_return false  #stubbing out randomness
			end

			it 'instructs a plane to land' do			
			expect(subject).to respond_to(:land).with(1).argument  #unsure how these 3 lines are shorter than a 1 liner: it {is_expected.to respond_to(:land).with(1).argument}
			end

			context 'when full' do

				it 'raises an error' do
				20.times do
					airport.land(plane)
				end
				expect{airport.land(plane)}.to raise_error 'Cannot land plane: airport full' 
				end
				end
			end
	
		end

		context 'when stormy' do

			before do
				allow(weather).to receive(:stormy?).and_return true  #stubbing out randomness
			end

			it 'raises an error if asked to land a plane' do	
			expect{airport.land(plane)}.to raise_error 'Cannot land plane: weather is stormy'
			end
		end

	describe '#take off' do

		context 'when not stormy' do

			before do
				allow(weather).to receive(:stormy?).and_return false  #stubbing out randomness
			end


			it 'instructs a plane to take off' do
			expect(subject).to respond_to(:take_off).with(1).argument
			end

			it 'rasies an error if plane is not at this airport' do
				other_airport = described_class.new(weather, 20)
				other_airport.land(plane)
				expect{airport.take_off(plane)}.to raise_error 'Cannot take off plane: plane not at this airport'
			end
		end

		context 'when stormy' do

			before do
				allow(weather).to receive(:stormy?).and_return true  #stubbing out randomness
			end

			it 'raises an error if asked to land a plane' do	
			expect{airport.take_off(plane)}.to raise_error 'Cannot take off plane: weather is stormy'
			end
		end
	end

	context 'defaults' do
		subject(:default_airport) {described_class.new(weather)}

		it 'has a default capacity' do
			allow(weather).to receive(:stormy?).and_return false
			described_class::DEFAULT_CAPACITY.times{default_airport.land(plane)}
			expect{default_airport.land(plane)}.to raise_error 'Cannot land plane: airport full'
		end
	end
end
	
## ?? ## why did we using :plane (vs plane) here, as we do in user_stories_spec (before refactoring to a double)?  Plane is a variable, not a method (or double for subject)?

