Play = {}

function Play:load()
  Arena:load()
  Ball:load()
  
  Player1 = Paddle.new(50, Screen.height / 2, 20, 100, 500, 1)
  
  if GameMode.multiPlayer then
    Player2 = Paddle.new(Screen.width - 70, Screen.height / 2, 20, 100, 500, 2)
  elseif GameMode.singlePlayer then
    SinglePlayerAI:load()
    self:setDifficulty()
  end
  
  Sound:startGame()
end


function Play:setDifficulty()
  if GameDifficulty.easy then
      SinglePlayerAI.rate = 0.5
    elseif GameDifficulty.normal then
      SinglePlayerAI.rate = 0.4
    elseif GameDifficulty.hard then
      SinglePlayerAI.rate = 0.3
    end
end


function Play:update(dt)
  Ball:update(dt)
  
  Player1:update(dt)
  
  if GameMode.multiPlayer then
    Player2:update(dt)
  elseif GameMode.singlePlayer then
    SinglePlayerAI:update(dt)
  end
  
  Sound:update()
end


function Play:draw()
  Arena:draw()
  Ball:draw()
  
  Player1:draw()
  
  if GameMode.multiPlayer then
    Player2:draw()
  elseif GameMode.singlePlayer then
    SinglePlayerAI:draw()
  end
end
