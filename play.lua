Play = {}

function Play:load()
  Arena:load()
  Ball:load()
  
  Player1 = Paddle.new(50, Screen.height / 2, 20, 100, 500, 1)
  
  if GameMode.multiPlayer then
    Player2 = Paddle.new(Screen.width - 70, Screen.height / 2, 20, 100, 500, 2)
  end
end


function Play:update(dt)
  Ball:update(dt)
  
  Player1:update(dt)
  
  if GameMode.multiPlayer then
    Player2:update(dt)
  end
  
  Sound:update()
end


function Play:draw()
  Arena:draw()
  Ball:draw()
  
  Player1:draw()
  
  if GameMode.multiPlayer then
    Player2:draw()
  end
end
