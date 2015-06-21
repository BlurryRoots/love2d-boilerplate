require ("lib.lclass.init")

class "MouseButtonUp"

function MouseButtonUp:MouseButtonUp (x, y, button)
	self.position = {
		x = x,
		y = y
	}
	self.button = button
end
