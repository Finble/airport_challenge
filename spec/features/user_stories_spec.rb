require 'airport'

describe 'These are all the user stories' do

	let(:airport) {Airport.new(20)}
	let(:plane) {Plane.new}

	context 'when not stormy' do
		before do
			allow(airport).to receive(:stormy?).and_return false  #stubbing out randomness
		end

# User Story 1
##############
# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land #(at an airport and confirm that it has landed)

		it 'so planes land at airport, instruct a plane to land' do
			expect{airport.land(plane)}.not_to raise_error #null test
		end

# User Story 2
##############
# As an air traffic controller 
# So planes can take off safely from my airport
# I would like to instruct a plane to take off

## ?? ## I want to code 'instruct - by whom to whom' and 'safely - some measure' and 'from an airport'...!!

		it 'so planes take off from airports, instruct a plane to take off' do
			expect{airport.take_off(plane)}.not_to raise_error 
		end

# User Story 3
##############
# As an air traffic controller 
# So I can avoid collisions
# I would to prevent airplanes landing when my airport is full

		context 'when airport is full' do

			it 'does not allow planes to land' do
				20.times do
					airport.land(plane)
				end
				expect{airport.land(plane)}.to raise_error 'Cannot land plane: airport full' 
			end
		end

## ?? ## at point args failed, I would have fixed by using a constant (wtih a capacity value) vs updating all new instances (and methods using new instances) with (20)!

# User Story 3
##############
# As an air traffic controller 
# So I can avoid accidents
# I want to prevent airplanes taking off or landing when the weather is stormy.
end

	context 'when weather is stormy' do

		before do
			allow(airport).to receive(:stormy?).and_return true #stubbing out randomness
		end

		it 'does not allow planes' do
			airport = Airport.new(20)
			plane = Plane.new	
			expect{airport.land(plane)}.to raise_error 'Cannot land plane: weather is stormy'
		end
	end
end


