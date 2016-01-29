require 'airport'

describe 'These are all the user stories' do

# User Story 1
##############
# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land #(at an airport and confirm that it has landed)

	it 'so planes land at airport, instruct a plane to land' do
		airport = Airport.new(20)
		plane = Plane.new
		expect{airport.land(plane)}.not_to raise_error #null test
	end

# User Story 2
##############
# As an air traffic controller 
# So planes can take off safely from my airport
# I would like to instruct a plane to take off

## ?? ## I want to code 'instruct - by whom to whom' and 'safely - some measure' and 'from an airport'...!!

	it 'so planes take off from airports, instruct a plane to take off' do
		airport = Airport.new(20)
		plane = Plane.new
		expect{airport.take_off(plane)}.not_to raise_error 
	end

# User Story 3
##############
# As an air traffic controller 
# So I can avoid collisions
# I would to prevent airplanes landing when my airport is full

	it 'does not allow planes to land when airport is full' do
		airport = Airport.new(20)
		plane = Plane.new
		20.times do
			airport.land(plane)
		end
		expect{airport.land(plane)}.to raise_error 'Cannot land plane: airport full' 
	end
end

## ?? ## at point args failed, I would have fixed by using a constant (wtih a capacity value) vs updating all new instances (and methods using new instances) with (20)!





