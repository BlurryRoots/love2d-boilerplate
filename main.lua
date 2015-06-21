require ("src.Game")

local game = nil

function love.load ()
	game = Game ()
end

function love.quit ()
	game:on_exit ()
end

function love.focus (f)
	if f then
		game:raise (FocusLost ())
	else
		game:raise (FocusGained ())
	end
end

function love.resize (w, h)
	game:raise (ResizeEvent (w, h))
end

function love.update (dt)
	game:on_update (dt)
end

function love.draw ()
	game:on_render ()
end

function love.mousepressed (x, y, button)
	game:raise (MouseButtonDown (x, y, button))
end

function love.mousereleased (x, y, button)
	game:raise (MouseButtonUp (x, y, button))
end

function love.keypressed (key)
	game:raise (KeyboardKeyDown (key))
end

function love.keyreleased (key)
	game:raise (KeyboardKeyUp (key))
end
