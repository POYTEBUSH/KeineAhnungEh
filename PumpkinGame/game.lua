require "characterMenu"
-- Pumpkins --   

function game_screen(pumpkinType)  
  chosenPumkin = pumpkinType
  pumpkinSprite = love.graphics.newImage("Sprites/".. chosenPumkin.. "_01.png")

  --print(pumpkinType)

  love.graphics.setFont(font.normal)
  love.mouse.setVisible(false)
  
  score.lives = 0
  
  love.graphics.draw(background.sky.sprite1, background.sky.x1, background.sky.Y)
  love.graphics.draw(background.sky.sprite1, background.sky.x2, background.sky.Y)
  love.graphics.draw(background.sky.sprite2, background.sky.bhills1x, background.sky.bhillsY)
  love.graphics.draw(background.sky.sprite2, background.sky.bhills2x, background.sky.bhillsY)
  love.graphics.draw(background.sky.sprite3, background.sky.hills1x, background.sky.hillsY)
  love.graphics.draw(background.sky.sprite3, background.sky.hills2x, background.sky.hillsY)
  love.graphics.draw(background.sky.sprite4, background.sky.fhills1x, background.sky.fhillsY)
  love.graphics.draw(background.sky.sprite4, background.sky.fhills2x, background.sky.fhillsY)
  love.graphics.draw(background.fence.sprite1, background.fence1X, background.fenceY)
  love.graphics.draw(background.fence.sprite1, background.fence2X, background.fenceY)
  
  if (life.value == 3) then    
    love.graphics.draw(lives, 310, 10)
    love.graphics.draw(lives, 270, 10)
    love.graphics.draw(lives, 230, 10)
  elseif (life.value == 2) then
    love.graphics.draw(lives, 310, 10)
    love.graphics.draw(lives, 270, 10)
  elseif (life.value == 1) then
    love.graphics.draw(lives, 310, 10)
  end

  
  love.graphics.setFont(font.score)
  love.graphics.print( "Score: ", 10, 15 )
  love.graphics.print(score.value, score.X, 15)
  love.graphics.setFont(font.normal)
    
  love.graphics.draw(pumpkinSprite, pumpkin.X, pumpkin.Y)  
  love.graphics.draw(pumpkinSprite, pumpkin.X2, pumpkin.Y2)
  love.graphics.draw(playerHand, mouse_x, mouse_y)
  love.graphics.draw(cauldron, 40, 450)  
  love.graphics.draw(marker.sprite, marker.X, marker.Y, angle, 1, 1, 15, 15)
  
  background.sky.x1   = background.sky.x1 - 0.6
  background.sky.x2   = background.sky.x2 - 0.6
  background.sky.bhills1x = background.sky.bhills1x -0.5
  background.sky.bhills2x = background.sky.bhills2x -0.5
  background.sky.hills1x = background.sky.hills1x -0.4
  background.sky.hills2x = background.sky.hills2x -0.4
  
  background.sky.fhills1x = background.sky.fhills1x -0.3
  background.sky.fhills2x = background.sky.fhills2x -0.3
  background.fence1X = background.fence1X -0.2
  background.fence2X = background.fence2X -0.2
  
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
  
  if background.sky.fhills1x <= -600 then
    background.sky.fhills1x = 600  
  elseif background.sky.fhills2x <= -600 then
    background.sky.fhills2x = 600
  end 
  
  if life.value == 0 then
    gameState = "menu"
  end
  
  if background.fence1X <= -365 then
    background.fence1X = 360  
  elseif background.fence2X <= -365 then
    background.fence2X = 360
  end 
  
  hitTest1 = CheckCollision(pumpkin.X,pumpkin.Y,pumpkin.W,pumpkin.H, marker.X,marker.Y,marker.W,marker.H)
    if(hitTest1) then
      pumpkin.Y = math.random(-50, 10)
      pumpkin.X = math.random(-100, 460)
      pumpkin.bounce = 0
      life.value = life.value - 1
    end
  hitTest1 = CheckCollision(pumpkin.X2,pumpkin.Y2,pumpkin.W,pumpkin.H, marker.X,marker.Y,marker.W,marker.H)
    if(hitTest1) then
      pumpkin.Y2 = math.random(-50, 10)
      pumpkin.X2 = math.random(-100, 460)
      pumpkin.bounce2 = 0
      life.value = life.value - 1
    end
  -- Click to send back --
  if pumpkin.bounce == 0 then
    hitTest2 = CheckCollision(pumpkin.X,pumpkin.Y,pumpkin.W,pumpkin.H, mouse_x,mouse_y,35,35)
      if(hitTest2) then
        pumpkin.speed = -300
        pumpkin.angle = math.angle(pumpkin.X, pumpkin.Y, mouse_x, mouse_y)
        pumpkin.bounce = 1
        score.value = score.value + 50
        MusicBoing:play()
      end
  end
  if pumpkin.bounce2 == 0 then
    hitTest2 = CheckCollision(pumpkin.X2,pumpkin.Y2,pumpkin.W,pumpkin.H, mouse_x,mouse_y,35,35)
      if(hitTest2) then
        pumpkin.speed2 = -300
        pumpkin.angle2 = math.angle(pumpkin.X2, pumpkin.Y2, mouse_x, mouse_y)
        pumpkin.bounce2 = 1
        score.value = score.value + 50
        MusicBoing:play()
      end
  end
end