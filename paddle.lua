Paddle = {}

function Paddle.new(x, y, width, height, speed)
  Paddle.x = x
  Paddle.y = y
  Paddle.width = width
  Paddle.height = height
  Paddle.speed = speed
end


function Paddle:update(dt)
  self:move(dt)
  self:collide()
end


function Paddle:collide()
  if checkCeiling(self, Screen) then
    self.y = 0
  end
  
  if checkFloor(self, Screen) then
    self.y = Screen.height - self.height
  end
end


function Paddle:move(dt)
  if love.keyboard.isDown("w") then
    self.y = self.y - self.speed * dt
  elseif love.keyboard.isDown("s") then
    self.y = self.y + self.speed * dt
  end
end


function Paddle:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
