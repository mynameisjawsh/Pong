GameOver = {}

function GameOver:load()
  Message = {
    font = love.graphics.newFont(128),
    text = " ",
    x = 100,
    y = 100
  }
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
end
