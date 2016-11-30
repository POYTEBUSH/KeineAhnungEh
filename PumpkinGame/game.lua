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

  --print(pumpkinType)

  love.graphics.setFont(font.normal)
  love.mouse.setVisible(false)
  
  love.graphics.draw(background.sky.sprite1, background.sky.x1, background.sky.Y)
  love.graphics.draw(background.sky.sprite1, background.sky.x2, background.sky.Y)
  love.graphics.draw(background.sky.sprite2, background.sky.bhills1x, background.sky.bhillsY)
  love.graphics.draw(background.sky.sprite2, background.sky.bhills2x, background.sky.bhillsY)
  love.graphics.draw(background.sky.sprite3, background.sky.hills1x, background.sky.hillsY)
  love.graphics.draw(background.sky.sprite3, background.sky.hills2x, background.sky.hillsY)
  --love.graphics.draw(background.trees.sprite1, btree1X, btreeY)
  --love.graphics.draw(background.trees.sprite1, btree2X, btreeY)
  love.graphics.draw(background.fence.sprite1, fence1X, fenceY)
  love.graphics.draw(background.fence.sprite1, fence2X, fenceY)
  --love.graphics.draw(background.one.sprite, background.one.quad, 0, -1)
  
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
  
  background.sky.x1   = background.sky.x1 - 0.6
  background.sky.x2   = background.sky.x2 - 0.6
  background.sky.bhills1x = background.sky.bhills1x -0.5
  background.sky.bhills2x = background.sky.bhills2x -0.5
    background.sky.hills1x = background.sky.hills1x -0.4
  background.sky.hills2x = background.sky.hills2x -0.4
  fence1X = fence1X -0.2
  fence2X = fence2X -0.2
  
  if background.sky.x1 <= -600 then
    background.sky.x1 = 600  
  elseif background.sky.x2 <= -600 then
    background.sky.x2 = 600
  end 
  
  if background.sky.bhills1x <= -600 then
    background.sky.bhills1x = 600  
  elseif background.sky.bhills2x <= -600 then
    background.sky.bhills2x = 600
  end  
  
  if background.sky.hills1x <= -600 then
    background.sky.hills1x = 600  
  elseif background.sky.hills2x <= -600 then
    background.sky.hills2x = 600
  end  
  
  if fence1X <= -365 then
    fence1X = 360  
  elseif fence2X <= -365 then
    fence2X = 360
  end  
  
  hitTest1 = CheckCollision(pumpkin.X,pumpkin.Y,pumpkin.W,pumpkin.H, marker.X,marker.Y,marker.W,marker.H)
    if(hitTest1) then
      pumpkin.Y = math.random(-50, 10)
      pumpkin.X = math.random(-100, 460)
      score.value = score.value - 100
    end
end