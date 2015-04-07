local TestScene = class("TestScene", Scene)
local TestObject = require "TestObject"
function TestScene:initialize()
   self:addEntity(TestObject:new())
end
return TestScene
