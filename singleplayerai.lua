SinglePlayerAI = {}

function SinglePlayerAI:load()
  self.x = Screen.width - 70
  self.y = Screen.height / 2
  self.width = 20
  self.height = 100
  self.yVel = 0
  self.speed = 500
  
  self.timer = 0
  self.rate = 0.5
end


function SinglePlayerAI:update(dt)
  self:move(dt)
  self:collide()
  
  self.timer = self.timer + dt
  if self.timer > self.rate then
    self.timer = 0
    self:predictBall()
  end
end


function SinglePlayerAI:collide()
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
    Ball.yVel = collisionPosition * 6
  end
end


function SinglePlayerAI:predictBall()
  if Ball.y < self.y then
      self.yVel = -self.speed
    elseif Ball.y > self.y + self.height then
      self.yVel = self.speed 
    else
      self.yVel = 0
    end
end


function SinglePlayerAI:move(dt)
  self.y = self.y + self.yVel * dt
end


function SinglePlayerAI:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
