SinglePlayerAI = {}

function SinglePlayerAI:load()
  self.x = Screen.width - 70
  self.y = Screen.height / 2
  self.width = 20
  self.height = 100
  self.speed = 500
end


function SinglePlayerAI:update(dt)
  
end


function SinglePlayerAI:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
