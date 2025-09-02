Sound = {}

function Sound:load()
  self.HitPaddle1 = love.audio.newSource("Assets/Sounds/Exports/HitPaddle1.wav", "static")
  self.HitPaddle2 = love.audio.newSource("Assets/Sounds/Exports/HitPaddle2.wav", "static")
  self.HitCeiling = love.audio.newSource("Assets/Sounds/Exports/HitCeiling.wav", "static")
  self.HitFloor = love.audio.newSource("Assets/Sounds/Exports/HitFloor.wav", "static")
  self.ClickButton = love.audio.newSource("Assets/Sounds/Exports/ClickButton.wav", "static")
end


function Sound:update()
  
end
