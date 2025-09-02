require("statehandler")
require("collisions")

require("start")
require("modeselect")
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
GameState.modeSelect = false
GameState.play = false
GameState.gameOver = false

GameMode = {}
GameMode.singlePlayer = false
GameMode.multiPlayer = false

function love.load()
  if GameState.boot then
    Start:load()
    
    PlayButton = Button.new(love.graphics.newFont(64), "Play", Screen.width / 2, Screen.height / 2, 225, 75)
    ExitButton = Button.new(love.graphics.newFont(64), "Exit", Screen.width / 2, Screen.height / 2 + 95, 225, 75)
  elseif GameState.modeSelect then
    ModeSelect:load()
    
    SinglePlayerButton = Button.new(love.graphics.newFont(52), "1 Player", Screen.width / 2, Screen.height / 2, 225, 75)
    MultiPlayerButton = Button.new(love.graphics.newFont(52), "2 Player", Screen.width / 2, Screen.height / 2 + 95, 225, 75)
  elseif GameState.play then
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
  if GameState.boot then
    Start:update()
  elseif GameState.modeSelect then
    ModeSelect:update()
  elseif GameState.play then
    player1:update(dt)
    player2:update(dt)
    Ball:update(dt)
  else
    GameOver:update()
  end
end


function love.draw()
  if GameState.boot then
    Start:draw()
    PlayButton:draw()
    ExitButton:draw()
  elseif GameState.modeSelect then
    ModeSelect:draw()
    SinglePlayerButton:draw()
    MultiPlayerButton:draw()
  elseif GameState.play then
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
  if mouseButton == 1 then
    
    if GameState.boot then
      
      if x >= PlayButton.x - 112.5 and x <= PlayButton.x - 112.5 + PlayButton.width and y >= PlayButton.y and y <= PlayButton.y + PlayButton.height then
        modeSelect()
      end
    elseif GameState.modeSelect then
      
      if x >= SinglePlayerButton.x - 112.5 and x <= SinglePlayerButton.x - 112.5 + SinglePlayerButton.width and y >= SinglePlayerButton.y and y <= SinglePlayerButton.y + SinglePlayerButton.height then
        GameMode.singlePlayer = true
        play()
      end
      
      if x >= MultiPlayerButton.x - 112.5 and x <= MultiPlayerButton.x - 112.5 + MultiPlayerButton.width and y >= MultiPlayerButton.y and y <= MultiPlayerButton.y +
MultiPlayerButton.height then
        GameMode.multiPlayer = true
        play()
      end
    elseif GameState.gameOver then
      
      if x >= RetryButton.x - 112.5 and x <= RetryButton.x - 112.5 + RetryButton.width and y >= RetryButton.y and y <= RetryButton.y + RetryButton.height then
        retry()
      end
    end
    
    if not GameState.play and not GameState.modeSelect then
      
      if x >= ExitButton.x - 112.5 and x <= ExitButton.x - 112.5 + ExitButton.width and y >= ExitButton.y and y <= ExitButton.y + ExitButton.height then
        love.event.quit()
      end
      
    end
  
  end
end
