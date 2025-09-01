require("arena")
require("paddle")

screenWidth = love.graphics.getWidth()
screenHeight = love.graphics.getHeight()

function love.load()
  Arena:load()
  Paddle:load()
end


function love.update(dt)
  Paddle:update(dt)
end


function love.draw()
  Arena:draw()
  Paddle:draw()
end
