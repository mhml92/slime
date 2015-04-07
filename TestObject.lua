local TestObject = class("TestObject", Entity)
local lg = love.graphics
local phys = love.physics

function TestObject:initialize(x, y, scene)
	Entity:initialize(x, y, scene)

	self.body = phys.newBody(self.scene.world, x, y, "dynamic")
	self.shape = phys.newCircleShape(16)
	self.fixture = phys.newFixture(self.body, self.shape)
end

function TestObject:update(dt)
	
end

function TestObject:draw()
	lg.circle("fill", self.body:getX(), self.body:getY(), 32, 32)
end
return TestObject
