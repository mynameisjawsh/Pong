require("arena")
require("paddle")
require("ball")

require("collisions")
require("statemanager")

require("gameover")

GameState = {}
GameState.play = true
GameState.gameOver = false

Screen = {}
Screen.x = 0
Screen.y = 0
Screen.width = love.graphics.getWidth()
Screen.height = love.graphics.getHeight()

function love.load()
  if GameState.play then
    Arena:load()
    
    playerOne = Paddle.new(50, Screen.height / 2, 20, 100, 500)
    playerTwo = Paddle.new(Screen.width - 70, Screen.height / 2, 20, 100, 500)
    
    Ball:load()
  elseif GameState.gameOver then
    GameOver:load()
  end
end


function love.update(dt)
  StateManager:manageStates()
  
  if GameState.play then
    playerOne:update(dt)
    playerTwo:update(dt)
    
    Ball:update(dt)
  elseif GameState.gameOver then
    GameOver:update()
  end
end


function love.draw()
  if GameState.play then
    Arena:draw()
    
    playerOne:draw()
    playerTwo:draw()
    
    Ball:draw()
  elseif GameState.gameOver then
    GameOver:draw()
  end
end
