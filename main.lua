require("statehandler")
require("collisions")
require("sound")

require("start")
require("modeselect")
require("play")
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
  Sound:load()
  
  if GameState.boot then
    Start:load()
  elseif GameState.modeSelect then
    ModeSelect:load()
  elseif GameState.play then
    Play:load()
  end
end


function love.update(dt)
  if GameState.boot then
    Start:update()
  elseif GameState.modeSelect then
    ModeSelect:update()
  elseif GameState.play then
    Play:update()
  end
end


function love.draw()
  if GameState.boot then
    Start:draw()
  elseif GameState.modeSelect then
    ModeSelect:draw()
  elseif GameState.play then
    Play:draw()
  end
end


function love.mousepressed(x, y, mouseButton)
  if mouseButton == 1 then
    
    if GameState.boot then
      
      if x >= PlayButton.x - 112.5 and x <= PlayButton.x - 112.5 + PlayButton.width and y >= PlayButton.y and y <= PlayButton.y + PlayButton.height then
        Sound:clickButton()
        modeSelect()
      end
    elseif GameState.modeSelect then
      
      if x >= SinglePlayerButton.x - 112.5 and x <= SinglePlayerButton.x - 112.5 + SinglePlayerButton.width and y >= SinglePlayerButton.y and y <= SinglePlayerButton.y + SinglePlayerButton.height then
        GameMode.singlePlayer = true
        Sound:clickButton()
        play()
      end
      
      if x >= MultiPlayerButton.x - 112.5 and x <= MultiPlayerButton.x - 112.5 + MultiPlayerButton.width and y >= MultiPlayerButton.y and y <= MultiPlayerButton.y +
MultiPlayerButton.height then
        GameMode.multiPlayer = true
        Sound:clickButton()
        play()
      end
    elseif GameState.gameOver then
      
      if x >= RetryButton.x - 112.5 and x <= RetryButton.x - 112.5 + RetryButton.width and y >= RetryButton.y and y <= RetryButton.y + RetryButton.height then
        Sound:clickButton()
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
