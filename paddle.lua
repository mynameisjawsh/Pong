Paddle = {}

function Paddle:load()
  self.x = 50
  self.y = Screen.height / 2
  self.width = 20
  self.height = 100
  self.speed = 500
end


function Paddle:update(dt)
  if love.keyboard.isDown("w") then
    self.y = self.y - self.speed * dt
  elseif love.keyboard.isDown("s") then
    self.y = self.y + self.speed * dt
  end
  
  if checkCeiling(self, Screen) then
    self.y = 0
  end
  
  if checkFloor(self, Screen) then
    self.y = Screen.height - self.height
  end
end


function Paddle:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
