require("arena")
require("paddle")
require("ball")

require("collisions")

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
  end
end


function love.update(dt)
  if GameState.play then
    playerOne:update(dt)
    playerTwo:update(dt)
    
    Ball:update(dt)
  end
end


function love.draw()
  if GameState.play then
    Arena:draw()
    
    playerOne:draw()
    playerTwo:draw()
    
    Ball:draw()
  end
end
