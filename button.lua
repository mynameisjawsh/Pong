Button = {}

function Button:load()
  self.font = love.graphics.newFont(64)
  self.text = "button"
  self.x = Screen.width / 2
  self.y = Screen.height / 2
  self.width = 225
  self.height = 75
  self.xOffset = self.width / 2
end


function Button:update()
  
end


function Button:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", self.x - self.xOffset, self.y, self.width, self.height)
  
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(self.font)
  love.graphics.print(self.text, self.x - self.xOffset, self.y)
end
