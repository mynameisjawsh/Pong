DifficultySelect = {}

function DifficultySelect:load()
  Message = {
    font = love.graphics.newFont(TitleFont, 128),
    text = "SELECT DIFFICULTY:",
    x = 100,
    y = 100
  }
  
  EasyButton = Button.new(love.graphics.newFont(ButtonFont, 128), "Easy", Screen.width / 2, Screen.height / 2, 230, 75)
  NormalButton = Button.new(love.graphics.newFont(ButtonFont, 128), "Normal", Screen.width / 2, Screen.height / 2 + 95, 230, 75)
  HardButton = Button.new(love.graphics.newFont(ButtonFont, 128), "Hard", Screen.width / 2, Screen.height / 2 + 190, 230, 75)
end


function DifficultySelect:update()
  
end


function DifficultySelect:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(Message.font)
  love.graphics.print(Message.text, Message.x, Message.y)
  
  EasyButton:draw()
  NormalButton:draw()
  HardButton:draw()
end
