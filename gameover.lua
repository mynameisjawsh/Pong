GameOver = {}

function GameOver:load()
  Message = {
    font = love.graphics.newFont(128),
    text = " ",
    x = 100,
    y = 100
  }
  
  Button:load()
end


function GameOver:update()
  if ScoreBoard.playerOneScore > ScoreBoard.playerTwoScore then
    Message.text = "Player One wins!"
  else
    Message.text = "Player Two wins!"
  end
  
  Button:update()
end


function GameOver:draw()
  love.graphics.setFont(Message.font)
  love.graphics.print(Message.text, Message.x, Message.y)
  
  Button:draw()
end
