Arena = {}

function Arena:load()
  Goal = {
    x = 0,
    y = 0,
    width = 30,
    height = screenHeight
  }
  Divider = {
    x = screenWidth / 2,
    y = 0,
    width = 10,
    height = screenHeight
  }
  Center = {
    x = screenWidth / 2,
    y = screenHeight / 2,
    radius = 100
  }
end


function Arena:draw()
  love.graphics.setColor(0, 1, 0)
  love.graphics.rectangle("fill", Goal.x, Goal.y, Goal.width, Goal.height)
  love.graphics.rectangle("fill", screenWidth - Goal.width, Goal.y, Goal.width, Goal.height)
  
  love.graphics.setColor(0.5, 0.5, 0.5)
  love.graphics.rectangle("fill", Divider.x - 5, Divider.y, Divider.width, Divider.height)
  
  love.graphics.circle("line", Center.x, Center.y, Center.radius)
end
