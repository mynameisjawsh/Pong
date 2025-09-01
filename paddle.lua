Paddle = {}

function Paddle.new(x, y, width, height, speed, player)
  local instance = {}
  setmetatable(instance, { __index = Paddle })
  
  instance.x = x
  instance.y = y
  instance.width = width
  instance.height = height
  instance.speed = speed
  instance.player = player
  
  return instance
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
  
  if checkPaddle(self, Ball) then
    Ball.xVel = -Ball.xVel
    local middleBall = Ball.y + Ball.height / 2
    local middlePaddle = self.y + self.height / 2
    local collisionPosition = middleBall - middlePaddle
    Ball.yVel = collisionPosition * 5
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
