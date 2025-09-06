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
  if checkPaddle(Player1, Ball) then
    love.audio.stop()
    love.audio.play(self.HitPaddle1)
  end
  
  if GameMode.multiPlayer then
    if checkPaddle(Player2, Ball) then
      love.audio.stop()
      love.audio.play(self.HitPaddle2)
    end
  elseif GameMode.singlePlayer then
    if checkPaddle(SinglePlayerAI, Ball) then
      love.audio.stop()
      love.audio.play(self.HitPaddle2)
    end
  end
  
  if checkGoal(Ball, Screen) then
    if GameMode.multiPlayer then
      if ScoreBoard.playerOneScore <= 9 and ScoreBoard.playerTwoScore <= 9 then
        love.audio.play(self.Goal1)
      end
    end
    
    if GameMode.singlePlayer then
      if Ball.x + Ball.width < Screen.x then
        if ScoreBoard.playerTwoScore <= 9 then
          love.audio.play(self.Goal2)
        end
      elseif Ball.x > Screen.x + Screen.width then
        if ScoreBoard.playerOneScore <= 9 then
          love.audio.play(self.Goal1)
        end
      end
    end
    
    Ball:load()
  end
end


function Sound:hitFloor()
  love.audio.stop()
  love.audio.play(self.HitFloor)
end


function Sound:hitCeiling()
  love.audio.stop()
  love.audio.play(self.HitCeiling)
end


function Sound:loseGame()
  love.audio.play(self.LoseGame)
end


function Sound:winGame()
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
