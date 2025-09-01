require("arena")
require("paddle")

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
