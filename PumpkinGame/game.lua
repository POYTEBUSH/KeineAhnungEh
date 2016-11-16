require "characterMenu"
-- Pumpkins --   

-- Score -- 
	score = 0
  scoreDisplay = {}
  scoreDisplay.x = 0
 	scoreDisplay.y = 0        
        
function game_screen(pumpkinType)  
  chosenPumkin = pumpkinType
  pumpkin = love.graphics.newImage("Sprites/".. chosenPumkin.. "_01.png")

  print(pumpkinType)

  love.graphics.setFont(font)
  love.mouse.setVisible(false)
  
  love.graphics.draw(sky1, sky1X, skyY)
  love.graphics.draw(sky2, sky2X, skyY)
  love.graphics.draw(background1, backgroundQuad, 0, -1)
  
  live1 = love.graphics.draw(lives, 310, 10)
  live2 = love.graphics.draw(lives, 270, 10)
  live3 = love.graphics.draw(lives, 230, 10)
  love.graphics.setFont(Scorefont)
  love.graphics.print(score, scoreX, 15)
  love.graphics.setFont(font)
    
  love.graphics.draw(pumpkin, pumpkinX, pumpkinY)
  
  love.graphics.draw(playerHand, mouse_x, mouse_y)
  love.graphics.draw(cauldron, 40, 450)
  
  love.graphics.draw(marker, markerX, markerY, angle, 1, 1, 15, 15)
  
  -- Debug -- 
  love.graphics.print( "Mouse X: ".. mouse_x .. " Mouse Y: " .. mouse_y, 10, 10 )
  love.graphics.print( "Sky1X: " .. sky1X, 10, 15 )
  love.graphics.print( "Sky2X: " .. sky2X, 10, 20 )
  love.graphics.print( "Game State: " .. gameState, 10, 25 )
  love.graphics.print( "Pumkin Chosen: " .. chosenPumkin, 10, 30 )
  
  sky1X = sky1X - 1
  sky2X = sky2X - 1
  
  if sky1X <= -360 then
    sky1X = 360
  
  elseif sky2X <= -360 then
    sky2X = 360
  end  
  
  hitTest1 = CheckCollision(pumpkinX, pumpkinY, 50, 50, markerX, markerY, 30, 30)
    if(hitTest1) then
      pumpkinY    = math.random(-50, 10)
      pumpkinX    = math.random(-100, 460)
      score           = score - 100
    end
end