require ("lib.lclass.init")

class "MouseButtonDown"

function MouseButtonDown:MouseButtonDown (x, y, button)
	self.position = {
		x = x,
		y = y
	}
	self.button = button
end
