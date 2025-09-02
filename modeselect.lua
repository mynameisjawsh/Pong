ModeSelect = {}

function ModeSelect:load()
  Message = {
    font = love.graphics.newFont(128),
    text = "Select Mode:",
    x = 100,
    y = 100
  }
end


function ModeSelect:update()
  
end


function ModeSelect:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(Message.font)
  love.graphics.print(Message.text, Message.x, Message.y)
end
