Arena = {}

function Arena:load()
  self.Goal = {
    x = 0,
    y = 0,
    width = 30,
    height = Screen.height
  }
  self.Divider = {
    x = Screen.width / 2,
    y = 0,
    width = 10,
    height = Screen.height
  }
  self.Center = {
    x = Screen.width / 2,
    y = Screen.height / 2,
    radius = 100
  }
  self.ScoreBoard = {
    font = love.graphics.newFont(64),
    x = 300,
    y = 100,
    playerOneScore = 0,
    playerTwoScore = 0
  }
end


function Arena:draw()
  love.graphics.setColor(0, 1, 0)
  love.graphics.rectangle("fill", self.Goal.x, self.Goal.y, self.Goal.width, self.Goal.height)
  love.graphics.rectangle("fill", Screen.width - self.Goal.width, self.Goal.y, self.Goal.width, self.Goal.height)
  
  love.graphics.setColor(0.5, 0.5, 0.5)
  love.graphics.rectangle("fill", self.Divider.x - 5, self.Divider.y, self.Divider.width, self.Divider.height)
  
  love.graphics.circle("line", self.Center.x, self.Center.y, self.Center.radius)
  
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(self.ScoreBoard.font)
  love.graphics.print(self.ScoreBoard.playerOneScore, self.ScoreBoard.x, self.ScoreBoard.y)
  love.graphics.print(self.ScoreBoard.playerTwoScore, Screen.width - (self.ScoreBoard.x + 50), self.ScoreBoard.y)
end
