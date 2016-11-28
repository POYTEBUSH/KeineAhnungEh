require "characterMenu"
-- Pumpkins --   

-- Score -- 
	score = {}      
  score.value = 0
  score.display = {}
  score.display.x = 0
  score.display.y = 0       
        
function game_screen(pumpkinType)  
  chosenPumkin = pumpkinType
  pumpkinSprite = love.graphics.newImage("Sprites/".. chosenPumkin.. "_01.png")

  print(pumpkinType)

  love.graphics.setFont(font.normal)
  love.mouse.setVisible(false)
  
  love.graphics.draw(background.sky.sprite1, sky1X, skyY)
  love.graphics.draw(background.sky.sprite1, sky2X, skyY)
  love.graphics.draw(background.hills.sprite1, hills1X, hillsY)
  love.graphics.draw(background.hills.sprite1, hills2X, hillsY)
  love.graphics.draw(background.one.sprite, background.one.quad, 0, -1)
  
  life = {}
  life.one = love.graphics.draw(lives, 310, 10)
  life.two = love.graphics.draw(lives, 270, 10)
  life.three = love.graphics.draw(lives, 230, 10)
  love.graphics.setFont(font.score)
  love.graphics.print(score.value, score.X, 15)
  love.graphics.setFont(font.normal)
    
  love.graphics.draw(pumpkinSprite, pumpkin.X, pumpkin.Y)
  
  love.graphics.draw(playerHand, mouse_x, mouse_y)
  love.graphics.draw(cauldron, 40, 450)
  
  love.graphics.draw(marker.sprite, marker.X, marker.Y, angle, 1, 1, 15, 15)
  
  -- Debug -- 
  love.graphics.print( "Mouse X: ".. mouse_x .. " Mouse Y: " .. mouse_y, 10, 10 )
  love.graphics.print( "Sky1X: " .. sky1X, 10, 15 )
  love.graphics.print( "Sky2X: " .. sky2X, 10, 20 )
  love.graphics.print( "Game State: " .. gameState, 10, 25 )
  love.graphics.print( "Pumkin Chosen: " .. chosenPumkin, 10, 30 )
  
  sky1X = sky1X - 1
  sky2X = sky2X - 1
  hills1X = hills1X -1
  hills2X = hills2X -1  
  
  if sky1X <= -360 then
    sky1X = 360  
  elseif sky2X <= -360 then
    sky2X = 360
  end 
  
    if hills1X <= -360 then
    hills1X = 360  
  elseif hills2X <= -360 then
    hills2X = 360
  end  
  
  hitTest1 = CheckCollision(pumpkin.X,pumpkin.Y,pumpkin.W,pumpkin.H, marker.X,marker.Y,marker.W,marker.H)
    if(hitTest1) then
      pumpkin.Y = math.random(-50, 10)
      pumpkin.X = math.random(-100, 460)
      score.value = score.value - 100
    end
end