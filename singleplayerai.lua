SinglePlayerAI = {}

function SinglePlayerAI:load()
  self.x = Screen.width - 70
  self.y = Screen.height / 2
  self.width = 20
  self.height = 100
  self.speed = 500
end


function SinglePlayerAI:update(dt)
  if Ball.xVel > 0 then
    
    if Ball.y < self.y + self.height / 2 then
      self.y = self.y - self.speed * dt
    end
    
    if Ball.y > self.y + self.height / 2 then
      self.y = self.y + self.speed * dt
    end
    
  end
  
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


function SinglePlayerAI:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
