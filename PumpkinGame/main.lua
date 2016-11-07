function love.load()
	-- Load --
		-- Game States --
			-- menu, game, game over
			gameState = "menu"
		-- Score -- 
			score = 0
			scoreDisplay = {}
  		scoreDisplay.x = 0
 			scoreDisplay.y = 0
		-- Fonts --
			  font = love.graphics.newFont("Fonts/deathrattlebb_reg.ttf", 15)
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
        
        sky1X = -360
        sky2X = 1
        sky3X = 360
        skyY  = 1
        
        sky1 = love.graphics.newImage("Sprites/sky1.png") 
        sky2 = love.graphics.newImage("Sprites/sky2.png") 
        sky3 = love.graphics.newImage("Sprites/sky3.png") 

 				--
 			-- Player --

 			-- Pumpkins --

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
  love.graphics.draw(sky3, sky2X, skyY)
  love.graphics.draw(background1, backgroundQuad, 0, -1)
  
  love.graphics.draw(lives, 310, 10)
  love.graphics.draw(lives, 270, 10)
  love.graphics.draw(lives, 230, 10)
  love.graphics.setFont(Scorefont)
  love.graphics.print(score, scoreX, 15)
  love.graphics.setFont(font)
  
  -- Debug -- 
  love.graphics.print( "Mouse X: ".. mouse_x .. " Mouse Y: " .. mouse_y, 10, 10 )
  love.graphics.print( "Sky1X: " .. sky1X, 10, 25 )
  love.graphics.print( "Sky2X: " .. sky2X, 10, 40 )
  love.graphics.print( "Sky3X: " .. sky3X, 10, 55 )
  love.graphics.print( "Game State: " .. gameState, 10, 70 )
  
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

function game_menu()
  sky1X = sky1X - 1
  sky2X = sky2X - 1
  sky3X = sky3X - 1 
  
  if sky1X <= -360 then
    sky1X = 360
  
  elseif sky2X <= -360 then
    sky2X = 360
    
  elseif sky3X <= -360 then
    sky3X = 360
  end
  
end

function love.update(dt)
	-- Game State 1 - Menu --
		if gameState == 1 then

		end

	-- Game State 2 - Game --
		if gameState == 2 then

		end

	-- Game State 3 - Over --
		if gameState == 3 then

		end

end

function love.update(dt)  
  mouse_x = love.mouse.getX()
  mouse_y = love.mouse.getY()
  
  -- For Debug --
  score = score +1
  
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
  
  if love.keyboard.isDown( " " ) then
    spacebar = spacebar + 1
  end

end