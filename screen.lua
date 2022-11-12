local screen = {
	width = 360,
	height = 640,

	left = function(self)
		return 0
	end,

	right = function(self)
		return self.width
	end,

	top = function(self)
		return 0
	end,

	bottom = function(self)
		return self.height
	end,
}

-------------------------------------------------------------------------------
return screen
