local Resources = class("Resources")

Resources.static.images = {}

function Resources.static:getImage(filename)
	if self.images[filename] == nil then
		local path = ""..filename
		self.images[filename] = lg.newImage(path)
		self.images[filename]:setFilter("nearest", "nearest")
	end
	return self.images[filename]
end

function Resources.static:loadImages()
end

return Resources
