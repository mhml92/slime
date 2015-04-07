local Floor = class("Floor", Entity)

local phys = love.physics

function Floor:initialize(x, y, w, h, scene)
	Entity.initialize(self, x, y, scene)
	self.width, self.height = w, h
	self.body = phys.newBody(self.scene.world, x, y, "static")
	self.shape = phys.newRectangleShape(w, h)
	self.fixture = phys.newFixture(self.body, self.shape)
end

function Floor:draw()
	love.graphics.rectangle("fill", self.x-self.width/2, self.y-self.height/2, self.width, self.height)
end

return Floor
