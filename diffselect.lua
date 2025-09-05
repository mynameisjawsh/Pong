DifficultySelect = {}

function DifficultySelect:load()
  Message = {
    font = love.graphics.newFont(128),
    text = "Select Difficulty:",
    x = 100,
    y = 100
  }
end


function DifficultySelect:update()
  
end


function DifficultySelect:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(Message.font)
  love.graphics.print(Message.text, Message.x, Message.y)
end
