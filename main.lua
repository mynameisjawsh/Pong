require("statehandler")
require("collisions")
require("sound")

require("start")
require("modeselect")
require("diffselect")
require("play")
require("gameover")

require("arena")
require("paddle")
require("singleplayerai")
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
GameState.difficultySelect = false
GameState.play = false
GameState.gameOver = false

GameMode = {}
GameMode.singlePlayer = false
GameMode.multiPlayer = false

GameDifficulty = {}
GameDifficulty.easy = false
GameDifficulty.normal = false
GameDifficulty.hard = false

function love.load()
  Sound:load()
  
  if GameState.boot then
    Start:load()
  elseif GameState.modeSelect then
    ModeSelect:load()
  elseif GameState.difficultySelect then
    DifficultySelect:load()
  elseif GameState.play then
    Play:load()
  elseif GameState.gameOver then
    GameOver:load()
  end
end


function love.update(dt)
  if GameState.boot then
    Start:update()
  elseif GameState.modeSelect then
    ModeSelect:update()
  elseif GameState.difficultySelect then
    DifficultySelect:update()
  elseif GameState.play then
    Play:update(dt)
  elseif GameState.gameOver then
    GameOver:update()
  end
end


function love.draw()
  if GameState.boot then
    Start:draw()
  elseif GameState.modeSelect then
    ModeSelect:draw()
  elseif GameState.difficultySelect then
    DifficultySelect:draw()
  elseif GameState.play then
    Play:draw()
  elseif GameState.gameOver then
    GameOver:draw()
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
        difficultySelect()
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
