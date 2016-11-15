-- require "menu"

function love.load()
	-- Load --
    math.randomseed(os.time())
    love.mouse.setVisible(false)
  
		-- Game States --
			gameState = "game"
      
		-- Score -- 
			score = 0
			scoreDisplay = {}
  		scoreDisplay.x = 0
 			scoreDisplay.y = 0
      
		-- Fonts --
      font = love.graphics.newFont("Fonts/advanced_pixel-7.ttf", 15)
      Scorefont = love.graphics.newFont("Fonts/deathrattlebb_reg.ttf", 40)
      love.graphics.setFont(font)
      
		-- Audio --    
			--local Music = love.audio.newSource('Audio/GB.mp3')
  		--Music:setLooping(true)
 			--Music:play()
      
    -- Sprites --
 			-- Background --        
 				background1 = love.graphics.newImage("Sprites/bg1.png")        
        backgroundQuad = love.graphics.newQuad(1,1,720/2,1280/2,720/2,1280/2)
        
        sky1X = 1
        sky2X = 360
        skyY  = 1
        
        sky              = love.graphics.newImage("Sprites/sky.png") 
        sky1             = love.graphics.newImage("Sprites/sky1.png") 
        sky2             = love.graphics.newImage("Sprites/sky2.png") 
        
 			-- Player --
        playerHand        = love.graphics.newImage("Sprites/playerHand.png")
        cauldron          = love.graphics.newImage("Sprites/Cauldron.png")

 			-- Pumpkins --      
        pumpkinChomp      = love.graphics.newImage("Sprites/pumpkinChomp_01.png") 
        pumpkinFemale     = love.graphics.newImage("Sprites/pumpkinFemale_01.png") 
        pumpking          = love.graphics.newImage("Sprites/pumpking_01.png") 
        pumpkinMale       = love.graphics.newImage("Sprites/pumpkinMale_01.png") 
        pumpkinRage       = love.graphics.newImage("Sprites/pumpkinRage_01.png") 
        
        pumpkinChompX     = math.random(-100, 460)
        pumpkinFemaleX    = math.random(-100, 460)
        pumpkingX         = math.random(-100, 460)
        pumpkinMaleX      = math.random(-100, 460)
        pumpkinRageX      = math.random(-100, 460)
        
        pumpkinChompY     = math.random(-50, 10)
        pumpkinFemaleY    = math.random(-50, 10)
        pumpkingY         = math.random(-50, 10)
        pumpkinMaleY      = math.random(-50, 10)
        pumpkinRageY      = math.random(-50, 10)
        
        marker = love.graphics.newImage("Sprites/marker.png")
        markerX = 180
        markerY = 450
        
        angle = 0 
        pumpkinAngle = 0
        speed = 100

 			-- Main Menu UI --

 			-- Menu UI --

 			-- Score UI --
      
       	lives = love.graphics.newImage("Sprites/lives.png")        
        score = 0
        scoreX = 200

 			-- Game Over UI --

end

function love.draw()
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
  
  if gameState == "game" then 

    game_screen() 
    
  elseif gameState == "menu" then
    game_menu()
    
  elseif gameState == "gameover" then
    love.graphics.print( "Mouse X: ".. mouse_x .. " Mouse Y: " .. mouse_y .. " Mouse Clicks: " .. mouseclicks, 10, 10 )
    love.graphics.print(score, 190, 218 )
    game_over()
  end
end

function math.angle(x1, y1, x2, y2)
  return math.atan2(y2 - y1, x2 - x1)
end

function game_menu()
  sky1X = sky1X - 1
  sky2X = sky2X - 1
  
  if sky1X <= -360 then
    sky1X = 360
  
  elseif sky2X <= -360 then
    sky2X = 360
  end
  
end

function game_screen()
  hitTest1 = CheckCollision(pumpkinRageX, pumpkinRageY, 50, 50, markerX, markerY, 30, 30)
    if(hitTest1) then
      pumpkinRageY    = math.random(-50, 10)
      pumpkinRageX    = math.random(-100, 460)
      score           = score - 100
    end
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end



function love.keypressed(key)
   if key == "tab" then
      local state = not love.mouse.isVisible()   -- the opposite of whatever it currently is
      love.mouse.setVisible(state)
   end
end



function love.update(dt)  
  mouse_x = love.mouse.getX()
  mouse_y = love.mouse.getY()  
  
  -- For Debug --
  score = score + 1
  love.graphics.rotate( 1 )
  
  angle = math.angle (markerX, markerY, pumpkinRageX, pumpkinRageY) 
  angle = angle + math.pi*.5
  
  -- calculate angle from enemy to player
  
  pumkinAngle = math.angle(pumpkinRageX, pumpkinRageY, markerX, markerY)
   -- work out how much x and y will change in this step
   -- math.cos and math.sin will be between -1 and +1
   -- multiplying by (dt*speed) means the enemy will move speed pixels in one whole second
   local dx = math.cos(pumkinAngle) * (dt * speed)
   local dy = math.sin(pumkinAngle) * (dt * speed)
   -- move to our new x and y
   pumpkinRageX = pumpkinRageX + dx
   pumpkinRageY = pumpkinRageY + dy
  
  -- To stop the score text overlaping the lives sprites --
  if score >= 10 then
    scoreX = 185
  end
  
  if score >= 100 then
    scoreX = 170
  end
  
  if score >= 1000 then
    scoreX = 150
  end

  --pumpkinChompY     = pumpkinChompY   + 1
  --pumpkinFemaleY    = pumpkinFemaleY  + 1
  --pumpkingY         = pumpkingY       + 1
  --pumpkinMaleY      = pumpkinMaleY    + 1
  --pumpkinRageY      = pumpkinRageY    + 1
  
  if pumpkinChompY > 640 then
    pumpkinChompY   = math.random(-50, 10)
    pumpkinChompX   = math.random(-100, 460)    
  elseif pumpkinFemaleY > 640 then
    pumpkinFemaleY  = math.random(-50, 10)
    pumpkinFemaleX  = math.random(-100, 460)    
  elseif pumpkingY > 640 then
    pumpkingY       = math.random(-50, 10)
    pumpkingX       = math.random(-100, 460)    
  elseif pumpkinMaleY > 640 then
    pumpkinMaleY    = math.random(-50, 10)
    pumpkinMaleX    = math.random(-100, 460) 
    
  elseif pumpkinRageY > 640 then
    pumpkinRageY    = math.random(-50, 10)
    pumpkinRageX    = math.random(-100, 460)
  end
  
  if love.keyboard.isDown( " " ) then
    spacebar        = spacebar + 1
  end

end