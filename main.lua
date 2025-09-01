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
  
  player1 = Paddle.new(50, Screen.height / 2, 20, 100, 500, 1)
  player2 = Paddle.new(Screen.width - 70, Screen.height / 2, 20, 100, 500, 2)
  
  Ball:load()
end


function love.update(dt)
  player1:update(dt)
  player2:update(dt)
  Ball:update(dt)
end


function love.draw()
  Arena:draw()
  player1:draw()
  player2:draw()
  Ball:draw()
end
