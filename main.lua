require("collisions")

require("arena")
require("paddle")
require("ball")

Screen = {}
Screen.x = 0
Screen.y = 0
Screen.width = love.graphics.getWidth()
Screen.height = love.graphics.getHeight()

function love.load()
  Arena:load()
  
  Paddle.new(50, Screen.height / 2, 20, 100, 500)
  
  Ball:load()
end


function love.update(dt)
  Paddle:update(dt)
  Ball:update(dt)
end


function love.draw()
  Arena:draw()
  Paddle:draw()
  Ball:draw()
end
