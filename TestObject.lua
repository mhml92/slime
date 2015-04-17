local TestObject = class("TestObject", Entity)
local lg = love.graphics
local phys = love.physics
local SMALL_RADIUS = 16
local SEG = 10

function TestObject:initialize(x, y, scene)
	Entity.initialize(self, x, y, scene)

	self.body = phys.newBody(self.scene.world, x, y, "dynamic")
	self.shape = phys.newCircleShape(16)
	self.fixture = phys.newFixture(self.body, self.shape)
	self.fixture:setRestitution(0.4)
   self.body:setLinearDamping(1)

	local FREQ = 1
	local DISTSCALE = 0.5

	self.nodes = {}
	local step = 2*math.pi/SEG
	local angle = 0
	for i=0,SEG-1 do
		local tx, ty = x+math.cos(angle)*32, y+math.sin(angle)*32
		local tmp = {}
		tmp.body = phys.newBody(self.scene.world, tx, ty, "dynamic")
		tmp.shape = phys.newCircleShape(SMALL_RADIUS)
		tmp.fixture = phys.newFixture(tmp.body, tmp.shape)
		tmp.fixture:setRestitution(0.4)
		tmp.body:setGravityScale(1)
		self.nodes[i] = tmp
		angle = angle + step
	end


	
	self.joints = {}
	for i=0,SEG-1 do
		for j=0,SEG-1 do
			if i > j then
				local a = self.nodes[i].body
				local b = self.nodes[j].body
				local ax, ay = a:getX(), a:getY()
				local bx, by = b:getX(), b:getY()
				local dist = math.sqrt((ax-bx)^2 + (ay-by)^2)
				local tmp = phys.newDistanceJoint(a, b, ax, ay, bx, by, DISTSCALE*dist, true)
				tmp:setFrequency(FREQ)
			end
		end
	end
	for i=0,SEG-1 do
		local a = self.nodes[i].body
		local ax, ay = a:getX(), a:getY()
		local dist = math.sqrt((ax-x)^2 + (ay-y)^2)
		local tmp = phys.newDistanceJoint(a, self.body, ax, ay, x, y, dist*DISTSCALE, true)
		tmp:setFrequency(FREQ)
      --tmp:setFrequency(2)
	end
	self.aiming = false
end

function TestObject:draw()
	lg.circle("fill", self.body:getX(), self.body:getY(), 16)
	if self.aiming then
		local mx, my = love.mouse.getPosition()
		local x, y = self.body:getX(), self.body:getY()
		local dx, dy = mx-x, my-y
		lg.line(x, y, x+dx, y+dy)
	end
	for i=0,SEG-1 do
		local a = self.nodes[i].body
		local b = self.nodes[(i+1)%SEG].body
		lg.line(a:getX(), a:getY(), b:getX(), b:getY())
	end
   for i = 0,SEG-1 do 
		local a = self.nodes[i].body
      lg.circle("fill",a:getX(),a:getY(),SMALL_RADIUS)
   end

end

function TestObject:mousepressed(x, y, button)
	--if self:checkCollision(x, y) then
		self.aiming = true
	--end
end

function TestObject:mousereleased(x, y, button)
	if self.aiming then
		local bx, by = self.body:getX(), self.body:getY()
		local dx, dy = x-bx, y-by
		self.body:setLinearVelocity(-5*dx, -5*dy)
      for i = 0,SEG-1 do
         local a = self.nodes[i].body
         a:setLinearVelocity(-5*dx,-5*dy)
         
      end

		--self.body:applyLinearImpulse(3*dx, 3*dy)
	end
	self.aiming = false
end

function TestObject:checkCollision(x, y)
	return (self.body:getX()-x)^2 + (self.body:getY()-y)^2 <= 16*16
end

return TestObject
