require "menu"
require "game"

function love.load()
	-- Load --
    math.randomseed(os.time())    
  
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
        button_spawn(180, 200, "Start Game", "start")
        button_spawn(180, 250, "Options", "options")
        button_spawn(180, 300, "Quit Game", "quit")

 			-- Score UI --
      
       	lives = love.graphics.newImage("Sprites/lives.png")        
        score = 0
        scoreX = 200

 			-- Game Over UI --

end

function love.draw()  
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
  love.graphics.draw(background1, backgroundQuad, 0, -1)
  button_draw()
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




function love.mousepressed(x, y)
  if gameState == "menu" then
    button_click(x, y)
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
  
  if pumpkinRageY > 640 then
    pumpkinRageY    = math.random(-50, 10)
    pumpkinRageX    = math.random(-100, 460)
  end
  
  if love.keyboard.isDown( " " ) then
    spacebar        = spacebar + 1
  end

end