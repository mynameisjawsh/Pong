require("arena")
require("paddle")
require("ball")

require("collisions")

Screen = {}
Screen.x = 0
Screen.y = 0
Screen.width = love.graphics.getWidth()
Screen.height = love.graphics.getHeight()

function love.load()
  Arena:load()
  
  playerOne = Paddle.new(50, Screen.height / 2, 20, 100, 500)
  
  Ball:load()
end


function love.update(dt)
  playerOne:update(dt)
  Ball:update(dt)
end


function love.draw()
  Arena:draw()
  playerOne:draw()
  Ball:draw()
end
