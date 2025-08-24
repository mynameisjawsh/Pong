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
  self.x = self.x + self.xVel * dt
  self.y = self.y + self.yVel * dt
  
  if checkPaddle(self, Paddle) then
    self.xVel = -self.xVel
    local middleBall = self.y + self.height / 2
    local middlePaddle = Paddle.y + Paddle.height / 2
    local collisionPosition = middleBall - middlePaddle
    self.yVel = collisionPosition * 5
  end
end


function Ball:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
