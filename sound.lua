Sound = {}

function Sound:load()
  self.HitPaddle1 = love.audio.newSource("Assets/Sounds/Exports/HitPaddle1.wav", "static")
  self.HitPaddle2 = love.audio.newSource("Assets/Sounds/Exports/HitPaddle2.wav", "static")
  self.HitCeiling = love.audio.newSource("Assets/Sounds/Exports/HitCeiling.wav", "static")
  self.HitFloor = love.audio.newSource("Assets/Sounds/Exports/HitFloor.wav", "static")
  self.ClickButton = love.audio.newSource("Assets/Sounds/Exports/ClickButton.wav", "static")
  self.Goal1 = love.audio.newSource("Assets/Sounds/Exports/Goal1.wav", "static")
  self.Goal2 = love.audio.newSource("Assets/Sounds/Exports/Goal2.wav", "static")
  
  self.StartGame = love.audio.newSource("Assets/Music/Exports/StartGame.wav", "static")
  self.WinGame = love.audio.newSource("Assets/Music/Exports/WinGame.wav", "static")
  self.LoseGame = love.audio.newSource("Assets/Music/Exports/LoseGame.wav", "static")
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
  
  if checkGoal(Ball, Screen) then
    if GameMode.multiPlayer then
      love.audio.stop()
      love.audio.play(self.Goal1)
    end
    
    if GameMode.singlePlayer then
      love.audio.stop()
      
      if Ball.x + Ball.width < Screen.x then
        love.audio.play(self.Goal2)
      elseif Ball.x > Screen.x + Screen.width then
        love.audio.play(self.Goal1)
      end
    end
    
    Ball:load()
  end
end


function Sound:loseGame()
  love.audio.stop()
  love.audio.play(self.LoseGame)
end


function Sound:winGame()
  love.audio.stop()
  love.audio.play(self.WinGame)
end


function Sound:startGame()
  love.audio.stop()
  love.audio.play(self.StartGame)
end


function Sound:clickButton()
  love.audio.stop()
  love.audio.play(self.ClickButton)
end
