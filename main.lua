require("statehandler")
require("collisions")

require("gameover")

require("arena")
require("paddle")
require("ball")
require("button")

Screen = {}
Screen.x = 0
Screen.y = 0
Screen.width = love.graphics.getWidth()
Screen.height = love.graphics.getHeight()

GameState = {}
GameState.boot = true
GameState.play = false
GameState.gameOver = false

function love.load()
  if GameState.play then
    Arena:load()
    
    player1 = Paddle.new(50, Screen.height / 2, 20, 100, 500, 1)
    player2 = Paddle.new(Screen.width - 70, Screen.height / 2, 20, 100, 500, 2)
    
    Ball:load()
  else
    GameOver:load()
    
    RetryButton = Button.new(love.graphics.newFont(64), "Retry", Screen.width / 2, Screen.height / 2, 225, 75)
    ExitButton = Button.new(love.graphics.newFont(64), "Exit", Screen.width / 2, Screen.height / 2 + 95, 225, 75)
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
    RetryButton:draw()
    ExitButton:draw()
  end
end


function love.mousepressed(x, y, mouseButton)
  if GameState.gameOver then
    if mouseButton == 1 then
      
      if x >= RetryButton.x - 112.5 and x <= RetryButton.x - 112.5 + RetryButton.width and y >= RetryButton.y and y <= RetryButton.y + RetryButton.height then
        retry()
      end
      
      if x >= ExitButton.x - 112.5 and x <= ExitButton.x - 112.5 + ExitButton.width and y >= ExitButton.y and y <= ExitButton.y + ExitButton.height then
        love.event.quit()
      end
      
    end
  end
end
