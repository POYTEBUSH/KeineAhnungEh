function game_screen()
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
    
  --love.graphics.draw(pumpkinChomp, pumpkinChompX, pumpkinChompY)
  --love.graphics.draw(pumpkinFemale, pumpkinFemaleX, pumpkinFemaleY)
  --love.graphics.draw(pumpking, pumpkingX, pumpkingY)
  --love.graphics.draw(pumpkinMale, pumpkinMaleX, pumpkinMaleY)
  love.graphics.draw(pumpkinRage, pumpkinRageX, pumpkinRageY)
  
  love.graphics.draw(playerHand, mouse_x, mouse_y)
  love.graphics.draw(cauldron, 40, 450)
  
  love.graphics.draw(marker, markerX, markerY, angle, 1, 1, 15, 15)
  
  -- Debug -- 
  love.graphics.print( "Mouse X: ".. mouse_x .. " Mouse Y: " .. mouse_y, 10, 10 )
  love.graphics.print( "Sky1X: " .. sky1X, 10, 25 )
  love.graphics.print( "Sky2X: " .. sky2X, 10, 40 )
  love.graphics.print( "Game State: " .. gameState, 10, 70 )
  love.graphics.print( "Pumkin Locations: " .. pumpkinChompX .. " " .. pumpkinFemaleX ..  " " .. pumpkingX ..  " " .. pumpkinMaleX ..  " " .. pumpkinRageX, 10, 85 )
  love.graphics.print( "Pumpkin Female Y: " .. pumpkinFemaleY, 10, 100 )
  
  sky1X = sky1X - 1
  sky2X = sky2X - 1
  
  if sky1X <= -360 then
    sky1X = 360
  
  elseif sky2X <= -360 then
    sky2X = 360
  end  
  
  hitTest1 = CheckCollision(pumpkinRageX, pumpkinRageY, 50, 50, markerX, markerY, 30, 30)
    if(hitTest1) then
      pumpkinRageY    = math.random(-50, 10)
      pumpkinRageX    = math.random(-100, 460)
      score           = score - 100
    end
end