Ball = {}

function Ball:load()
  self.x = Screen.width / 2
  self.y = Screen.height / 2
  self.width = 20
  self.height = 20
  self.speed = 200
  self.xVel = -self.speed 
  self.yVel = 0
end


function Ball:update(dt)
  self:move(dt)
  self:collide()
end


function Ball:collide()
  if checkCeiling(self, Screen) then
    self.yVel = -self.yVel
  end
  
  if checkFloor(self, Screen) then
    self.yVel = -self.yVel
  end
  
  if checkGoal(self, Screen) then
    self:score()
    self:load()
  end
end


function Ball:score()
  if self.x + self.width < Screen.x then
    ScoreBoard.playerTwoScore = ScoreBoard.playerTwoScore + 1
  elseif self.x > Screen.x + Screen.width then
    ScoreBoard.playerOneScore = ScoreBoard.playerOneScore + 1
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
