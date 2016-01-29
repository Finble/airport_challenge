class Airport

	def initialize(capacity)	
		@capacity = capacity	
		@planes = []
	end

	def land(plane)
		raise 'Cannot land plane: airport full' if full?
		raise 'Cannot land plane: weather is stormy' if stormy?
		@planes << plane
	end

	def take_off(plane)
	end

	private

	def full?
		@planes.length >= @capacity
	end

	def stormy?
		rand(1..6) > 4  # randomly selects 1/3 of the time (5 + 6 /4 = true, 2/16 = 1/3)
	end
end

