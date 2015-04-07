local Entity = class("Entity")

function Entity:initialize(x, y, scene)
	self.x = x
	self.y = y
	self.active = true
	self.alive  = true
	self.scene = scene
end

function Entity:update(dt)
end

function Entity:draw()
end

function Entity:kill()
	self.alive = false
end

function Entity:isAlive()
	return self.alive;
end

function Entity:setActive(value)
	self.active = value
end

function Entity:isActive()
	return self.active
end

function Entity:keypressed(key, isrepeat)
end

function Entity:keyreleased(key, isrepeat)
end

function Entity:mousepressed(x, y, button)
end

function Entity:mousereleased(x, y, button)
end

return Entity
