Sound = {}

function Sound:load()
  self.HitPaddle1 = love.audio.newSource("Assets/Sounds/Exports/HitPaddle1.wav", "static")
  self.HitPaddle2 = love.audio.newSource("Assets/Sounds/Exports/HitPaddle2.wav", "static")
  self.HitCeiling = love.audio.newSource("Assets/Sounds/Exports/HitCeiling.wav", "static")
  self.HitFloor = love.audio.newSource("Assets/Sounds/Exports/HitFloor.wav", "static")
  self.ClickButton = love.audio.newSource("Assets/Sounds/Exports/ClickButton.wav", "static")
  self.Goal1 = love.audio.newSource("Assets/Sounds/Exports/Goal1.wav", "static")
  self.Goal2 = love.audio.newSource("Assets/Sounds/Exports/Goal2.wav", "static")
end


function Sound:update()
  if checkPaddle(player1, Ball) then
    love.audio.stop()
    love.audio.play(self.HitPaddle1)
  end
  
  if checkPaddle(player2, Ball) then
    love.audio.stop()
    love.audio.play(self.HitPaddle2)
  end
  
  if checkCeiling(Ball, Screen) then
    love.audio.stop()
    love.audio.play(self.HitCeiling)
  end
  
  if checkFloor(Ball, Screen) then
    love.audio.stop()
    love.audio.play(self.HitFloor)
  end
end


function Sound:clickButton()
  love.audio.stop()
  love.audio.play(self.ClickButton)
end
