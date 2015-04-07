local TestScene = class("TestScene", Scene)
local TestObject = require "TestObject"
local Floor = require "Floor" 

local METER = 16

function TestScene:initialize()
   Scene.initialize(self)
   love.physics.setMeter(METER)
   self.world = love.physics.newWorld(0, 9.82*METER, true)
   self:addEntity(TestObject:new(400, 100, self))
	local w, h = love.window.getDimensions()
   self:addEntity(Floor:new(w/2, h, w, 10, self))
   self:addEntity(Floor:new(w/2, 0, w, 10, self))
   self:addEntity(Floor:new(0, h/2, 10, h, self))
   self:addEntity(Floor:new(w, h/2, 10, h, self))
end

function TestScene:update(dt)
	self.world:update(dt)
	Scene.update(self, dt)
end

function TestScene:draw()
	Scene.draw(self)
	love.graphics.print("Press screen to move ball!", 20, 50)
end

return TestScene
