math.random = love.math.random

class       = require 'middleclass/middleclass'
Scene       = require 'Scene'
Entity      = require 'Entity' 
local TestScene = require "TestScene"
local time = {}
time.fdt = 1/60 --fixed delta time
time.accum = 0
local self = {}
function love.load()
   love.mouse.setVisible(false)
   local w,h = love.graphics.getDimensions()
   love.graphics.setScissor( 0, 0, w, h)
   self.scene = TestScene:new()   
end

function love.update(dt)
   time.accum = time.accum + dt 
   while time.accum >= time.fdt do
      self.scene:update(time.fdt)
      if love.keyboard.isDown('escape') then
         love.event.quit()
      end
      time.accum = time.accum - time.fdt
   end
end

function love.draw()
   self.scene:draw()
   love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10) 
end 

function beginContact(a,b,coll)
   self.scene:beginContact(a,b,coll)
end

function endContact(a,b,coll)
   self.scene:endContact(a,b,coll)
end

function preSolve(a,b,coll)
   self.scene:preSolve(a,b,coll)
end

function postSolve(a, b, coll, normalimpulse1, tangentimpulse1, normalimpulse2, tangentimpulse2)
   self.scene:postSolve(a, b, coll, normalimpulse1, tangentimpulse1, normalimpulse2, tangentimpulse2)
end
