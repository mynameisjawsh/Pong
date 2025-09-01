Arena = {}

function Arena:load()
  Goal = {
    x = 0,
    y = 0,
    width = 30,
    height = Screen.height
  }
  Divider = {
    x = Screen.width / 2,
    y = 0,
    width = 10,
    height = Screen.height
  }
  Center = {
    x = Screen.width / 2,
    y = Screen.height / 2,
    radius = 100
  }
  ScoreBoard = {
    font = love.graphics.newFont(64),
    playerOneScore = 0,
    playerTwoScore = 0
  }
end


function Arena:draw()
  love.graphics.setColor(0, 1, 0)
  love.graphics.rectangle("fill", Goal.x, Goal.y, Goal.width, Goal.height)
  love.graphics.rectangle("fill", Screen.width - Goal.width, Goal.y, Goal.width, Goal.height)
  
  love.graphics.setColor(0.5, 0.5, 0.5)
  love.graphics.rectangle("fill", Divider.x - 5, Divider.y, Divider.width, Divider.height)
  
  love.graphics.circle("line", Center.x, Center.y, Center.radius)
  
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(ScoreBoard.font)
  love.graphics.print(ScoreBoard.playerOneScore, 300, 100)
  love.graphics.print(ScoreBoard.playerTwoScore, Screen.width - 300, 100)
end
