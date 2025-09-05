Ball = {}

Ball.servingPlayer = 2

function Ball:load()
  self.x = Screen.width / 2
  self.y = Screen.height / 2
  self.width = 20
  self.height = 20
  self.speed = 225
  self.xVel = -self.speed 
  self.yVel = 0
  
  self:determineXVel()
end


function Ball:determineXVel()
  if self.servingPlayer == 2 then
    self.xVel = -self.speed 
  elseif self.servingPlayer == 1 then
    self.xVel = self.speed 
  end
end


function Ball:update(dt)
  self:move(dt)
  self:collide()
end


function Ball:collide()
  if checkCeiling(self, Screen) then
    Sound:hitCeiling()
    self.y = 0
    self.yVel = -self.yVel
  end
  
  if checkFloor(self, Screen) then
    Sound:hitFloor()
    self.y = Screen.height - self.height
    self.yVel = -self.yVel
  end
  
  if checkGoal(self, Screen) then
    self:score()
  end
end


function Ball:score()
  if self.x + self.width < Screen.x then
    ScoreBoard.playerTwoScore = ScoreBoard.playerTwoScore + 1
    self.servingPlayer = 1
  elseif self.x > Screen.x + Screen.width then
    ScoreBoard.playerOneScore = ScoreBoard.playerOneScore + 1
    self.servingPlayer = 2
  end
  
  checkState()
end


function Ball:move(dt)
  self.x = self.x + self.xVel * dt
  self.y = self.y + self.yVel * dt
end


function Ball:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
