Start = {}

function Start:load()
  Title = {
    font = love.graphics.newFont(128),
    text = "Pong",
    x = Screen.width / 2,
    y = 100
  }
end


function Start:update()
  
end


function Start:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(Title.font)
  love.graphics.print(Title.text, Title.x - 128, Title.y)
end
