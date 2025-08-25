StateManager = {}

function StateManager:manageStates()
  if Arena.ScoreBoard.playerOneScore >= 10 or Arena.ScoreBoard.playerTwoScore >= 10 then
    GameState.play = false
    GameState.gameOver = true
    love.load()
  end
end
