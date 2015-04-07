local TestObject = class("TestObject", Entity)
local lg = love.graphics

function TestObject:initialize(x, y, scene)
	self.initialize(self, x, y, scene)
end

function update(dt)
	self.x = self.x + 100*dt
end

function draw()
	lg.rectangle("fill", self.x, self.y, 20, 20)
end
