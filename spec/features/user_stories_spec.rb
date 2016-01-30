require 'airport'
require 'plane'

describe 'These are all the user stories' do

	let(:airport) {Airport.new(weather, 20)}
	let(:plane) {Plane.new}
	let(:weather) {Weather.new}

	context 'when not stormy' do
		before do
			allow(weather).to receive(:stormy?).and_return false  #stubbing out randomness
		end

# User Story 1
##############
# As an air traffic controller 
# So planes can land safely at my airport 
# I want to instruct a plane to land 

		it 'so planes land at airport, instruct a plane to land' do
			expect{airport.land(plane)}.not_to raise_error #null test
		end

# User Story 2
##############
# As an air traffic controller 
# So planes can take off safely from my airport
# I would like to instruct a plane to take off

		it 'so planes take off from airports, instruct a plane to take off' do
			airport.land(plane)  #land plane first so we have at least 1 plane in the array
			expect{airport.take_off(plane)}.not_to raise_error 
		end

# User Story 5
##############
# As an air traffic controller
# So that I can ensure safe take off procedures
# I would like to instruct a plane to take off

		it 'takes off planes only from the airport they are at' do
			airport_2 = Airport.new(weather, 20)
			airport_2.land(plane)
			expect{airport.take_off(plane)}.to raise_error 'Cannot take off plane: plane not at this airport'
		end

# User Story 6
##############
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overriden as appropriate

		it 'airports have a default capacity' do
			default_airport = Airport.new(weather)
			Airport::DEFAULT_CAPACITY.times {default_airport.land(plane)}
			expect {default_airport.land(plane)}.to raise_error 'Cannot land plane: airport full'
		end

# User Story 7
##############
# As an air traffic controller
# So the system is consistent and correctly reports plane status and location
# I want to ensure a flying plane cannot take off and cannot be in an airport

	it 'flying planes cannot take off' do
		airport.land(plane)
		flying_plane = airport.take_off(plane)
		expect{flying_plane.take_off}.to raise_error 'Plane cannot take off: plane already flying'
		end 

	it 'flying planes cannot be in an airport' do
		airport.land(plane)
		flying_plane = airport.take_off(plane)
		expect{flying_plane.airport}.to raise_error 'Plane cannot be at an airport: plane already flying'
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

# User Story 4
##############
# As an air traffic controller 
# So I can avoid accidents
# I want to prevent airplanes taking off or landing when the weather is stormy.
end

	context 'when weather is stormy' do

		before do
			allow(weather).to receive(:stormy?).and_return true #stubbing out randomness
		end

		it 'does not allow planes to land' do
			expect{airport.land(plane)}.to raise_error 'Cannot land plane: weather is stormy'
		end

		it 'does not allow planes to take off' do
			expect {airport.take_off(plane)}.to raise_error 'Cannot take off plane: weather is stormy'
		end
	end
end


