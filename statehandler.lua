function checkState()
  if GameState.play and ScoreBoard.playerOneScore >= 10 or ScoreBoard.playerTwoScore >= 10 then
    GameState.play = false
    GameState.gameOver = true
    love.load()
  end
end


function goToMenu()
  if GameState.gameOver then
    GameState.gameOver = false
    GameState.boot = true
    GameMode.singlePlayer = false
    GameMode.multiPlayer = false
    GameDifficulty.easy = false
    GameDifficulty.normal = false
    GameDifficulty.hard = false
    love.load()
  end
end


function retry()
  if GameState.gameOver then
    GameState.gameOver = false
    GameState.play = true
    love.load()
  end
end


function play()
  if GameState.difficultySelect then
    GameState.difficultySelect = false
    GameState.play = true
    love.load()
  end
end

function twoPlayer()
  if GameState.modeSelect then
    GameState.modeSelect = false
    GameState.play = true
    love.load()
  end
end


function modeSelect()
  if GameState.boot then
    GameState.boot = false
    GameState.modeSelect = true
    love.load()
  end
end


function difficultySelect()
  if GameState.modeSelect then
    GameState.modeSelect = false
    GameState.difficultySelect = true
    love.load()
  end
end
