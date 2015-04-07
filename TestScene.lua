local TestScene = class("TestScene", Scene)
local TestObject = require "TestObject"
function TestScene:initialize()
   Scene:initialize()
   local o = TestObject:new(20,20,self)
   print(o)
   self:addEntity(o)
end
return TestScene
