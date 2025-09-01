function checkState()
  if ScoreBoard.playerOneScore >= 10 or ScoreBoard.playerTwoScore >= 10 then
    GameState.play = false
    GameState.gameOver = true
    love.load()
  end
end
