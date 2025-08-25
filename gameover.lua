GameOver = {}

function GameOver:load()
  self.Message = {
    font = love.graphics.newFont(64),
    text = "text",
    x = 100,
    y = 100
  }
  
  --buttons
end


function GameOver:update()
  if Arena.ScoreBoard.playerOneScore > Arena.ScoreBoard.playerTwoScore then
    self.Message.text = "Player One Wins!"
  elseif Arena.ScoreBoard.playerOneScore < Arena.ScoreBoard.playerTwoScore then
    self.Message.text = "Player Two Wins!"
  end
end


function GameOver:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(self.Message.font)
  love.graphics.print(self.Message.text, self.Message.x, self.Message.y)
end
