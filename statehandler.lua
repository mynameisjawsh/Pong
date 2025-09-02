function checkState()
  if GameState.play and ScoreBoard.playerOneScore >= 10 or ScoreBoard.playerTwoScore >= 10 then
    GameState.play = false
    GameState.gameOver = true
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
