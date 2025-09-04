ModeSelect = {}

function ModeSelect:load()
  Message = {
    font = love.graphics.newFont(128),
    text = "Select Mode:",
    x = 100,
    y = 100
  }
  
  SinglePlayerButton = Button.new(love.graphics.newFont(52), "1 Player", Screen.width / 2, Screen.height / 2, 225, 75)
  MultiPlayerButton = Button.new(love.graphics.newFont(52), "2 Player", Screen.width / 2, Screen.height / 2 + 95, 225, 75)
end


function ModeSelect:update()
  
end


function ModeSelect:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(Message.font)
  love.graphics.print(Message.text, Message.x, Message.y)
  
  SinglePlayerButton:draw()
  MultiPlayerButton:draw()
end
