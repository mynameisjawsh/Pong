GameOver = {}

function GameOver:load()
  Message = {
    font = love.graphics.newFont(128),
    text = " ",
    x = 100,
    y = 100
  }
  
  RetryButton = Button.new(love.graphics.newFont(64), "Retry", Screen.width / 2, Screen.height / 2, 225, 75)
  ExitButton = Button.new(love.graphics.newFont(64), "Exit", Screen.width / 2, Screen.height / 2 + 95, 225, 75)
end


function GameOver:update()
  if ScoreBoard.playerOneScore > ScoreBoard.playerTwoScore then
    Message.text = "Player One wins!"
  else
    Message.text = "Player Two wins!"
  end
end


function GameOver:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(Message.font)
  love.graphics.print(Message.text, Message.x, Message.y)
  
  RetryButton:draw()
  ExitButton:draw()
end
