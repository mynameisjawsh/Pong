require("statehandler")
require("collisions")

require("gameover")

require("arena")
require("paddle")
require("ball")

Screen = {}
Screen.x = 0
Screen.y = 0
Screen.width = love.graphics.getWidth()
Screen.height = love.graphics.getHeight()

GameState = {}
GameState.play = true
GameState.gameOver = false

function love.load()
  if GameState.play then
    Arena:load()
    
    player1 = Paddle.new(50, Screen.height / 2, 20, 100, 500, 1)
    player2 = Paddle.new(Screen.width - 70, Screen.height / 2, 20, 100, 500, 2)
    
    Ball:load()
  else
    GameOver:load()
  end
end


function love.update(dt)
  if GameState.play then
    player1:update(dt)
    player2:update(dt)
    Ball:update(dt)
  else
    GameOver:update()
  end
end


function love.draw()
  if GameState.play then
    Arena:draw()
    player1:draw()
    player2:draw()
    Ball:draw()
  else
    GameOver:draw()
  end
end
