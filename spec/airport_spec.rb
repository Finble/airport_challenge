require 'airport'

describe Airport do

	subject(:airport) {described_class.new(20)}  # subject = new class of described class, which is Airport

	it 'instructs a plane to land' do
		expect(subject).to respond_to(:land).with(1).argument  #unsure how these 3 lines are shorter than a 1 liner: it {is_expected.to respond_to(:land).with(1).argument}
	end

	it 'instructs a plane to take off' do
		expect(subject).to respond_to(:take_off)
	end

	it 'does not allow landing when at capacity' do
		plane = double(:plane)
		20.times do
			airport.land(plane)
		end
		expect{airport.land(plane)}.to raise_error 'Cannot land plane: airport full' 
	end
end
	
## ?? ## why did we using :plane (vs plane) here, as we do in user_stories_spec (before refactoring to a double)?  Plane is a variable, not a method (or double for subject)?

