GameOver = {}

function GameOver:load()
  Message = {
    font = love.graphics.newFont(TitleFont, 128),
    text = " ",
    x = 100,
    y = 100
  }
  
  RetryButton = Button.new(love.graphics.newFont(ButtonFont, 128), "Retry", Screen.width / 2, Screen.height / 2, 225, 75)
  MenuButton = Button.new(love.graphics.newFont(ButtonFont, 128), "Menu", Screen.width / 2, Screen.height / 2 + 95, 225, 75)
  ExitButton2 = Button.new(love.graphics.newFont(ButtonFont, 128), "Exit", Screen.width / 2, Screen.height / 2 + 190, 225, 75)
  
  if GameMode.singlePlayer then
    if ScoreBoard.playerOneScore > ScoreBoard.playerTwoScore then
      Sound:winGame()
    else
      Sound:loseGame()
    end
  elseif GameMode.multiPlayer then
    Sound:winGame()
  end
end


function GameOver:update()
  if ScoreBoard.playerOneScore > ScoreBoard.playerTwoScore then
    Message.text = "PLAYER ONE WINS!"
  else
    Message.text = "PLAYER TWO WINS!"
  end
end


function GameOver:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(Message.font)
  love.graphics.print(Message.text, Message.x, Message.y)
  
  RetryButton:draw()
  MenuButton:draw()
  ExitButton2:draw()
end
