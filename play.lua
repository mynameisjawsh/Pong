Play = {}

function Play:load()
  Arena:load()
  Ball:load()
  
  Player1 = Paddle.new(50, Screen.height / 2, 20, 100, 500, 1)
end


function Play:update(dt)
  Ball:update(dt)
  
  Player1:update(dt)
  
  Sound:update()
end


function Play:draw()
  Arena:draw()
  Ball:draw()
  
  Player1:draw()
end
