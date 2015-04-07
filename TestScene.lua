local TestScene = class("TestScene", Scene)
local TestObject = require "TestObject"

local METER = 16

function TestScene:initialize()
   Scene:initialize()
   love.physics.setMeter(METER)
   self.world = love.physics.newWorld(0, 9.82*METER, true)
   local o = TestObject:new(400,20,self)
   self:addEntity(o)
end

function TestScene:update(dt)
	self.world:update(dt)
	Scene:update(dt)
end

return TestScene
