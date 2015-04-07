local TestObject = class("TestObject", Entity)
local lg = love.graphics
local phys = love.physics

function TestObject:initialize(x, y, scene)
	Entity.initialize(self, x, y, scene)

	self.body = phys.newBody(self.scene.world, x, y, "dynamic")
	self.shape = phys.newCircleShape(16)
	self.fixture = phys.newFixture(self.body, self.shape)
	self.fixture:setRestitution(0.4)
end

function TestObject:update(dt)
	
end

function TestObject:draw()
	lg.circle("fill", self.body:getX(), self.body:getY(), 16)
end

function TestObject

return TestObject
