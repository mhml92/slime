local TestObject = class("TestObject", Entity)
local lg = love.graphics

function TestObject:initialize(x, y, scene)
	Entity:initialize(x, y, scene)
end

function TestObject:update(dt)
	self.x = self.x + 100*dt
end

function TestObject:draw()
   lg.setColor(255,255,255)
	lg.rectangle("fill", self.x, self.y, 20, 20)
end
return TestObject
