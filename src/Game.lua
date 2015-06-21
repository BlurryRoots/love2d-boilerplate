require ("src.events.FocusGainedEvent")
require ("src.events.FocusLostEvent")
require ("src.events.KeyboardKeyDownEvent")
require ("src.events.KeyboardKeyUpEvent")
require ("src.events.MouseButtonDownEvent")
require ("src.events.MouseButtonUpEvent")
require ("src.events.ResizeEvent")

require ("src.EventManager")

require ("lib.lclass.init")

class "Game"

function Game:Game ()
	--
	self.eventManager = EventManager ()

	self.eventManager:subscribe ("FocusGained", self)
	self.eventManager:subscribe ("FocusLost", self)
	self.eventManager:subscribe ("KeyboardKeyDown", self)
	self.eventManager:subscribe ("KeyboardKeyUp", self)
	self.eventManager:subscribe ("MouseButtonDown", self)
	self.eventManager:subscribe ("MouseButtonUp", self)
	self.eventManager:subscribe ("Resize", self)

	self.handlers = {
		MouseButtonDown = function (event)
			self.message = event.button
		end,
		MouseButtonUp = function (event)
			self.message = "keksnase!"
		end,
	}

	self.message = "keksnase!"
end

function Game:raise (event)
	self.eventManager:push (event)
end

function Game:handle (event)
	if not self.handlers[event.__type] then
		print("could not find handler for " .. event:get_type ())
	else
		self.handlers[event:get_type ()] (event)
	end
end

function Game:on_update (dt)
	self.eventManager:update (dt)
end

function Game:on_render ()
	love.graphics.print (self.message, 42, 42)
end

function Game:on_exit ()
end
