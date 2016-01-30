class Weather

	def stormy?
		Kernel.rand(1..6) > 4 # randomly selects 1/3 of the time (5 + 6 /4 = true, 2/16 = 1/3)
	end

end