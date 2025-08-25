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
  
end


function GameOver:draw()
  love.graphics.setFont(self.Message.font)
  love.graphics.print(self.Message.text, self.Message.x, self.Message.y)
end
