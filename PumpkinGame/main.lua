require "menu"
require "game"
require "optionsMenu"
require "options"
require "characterSelect"
require "characterMenu"

function love.load()
	-- Load --
    math.randomseed(os.time())      
    pumpkinSet = "pumpkinMale"        
  
		-- Game States --
			gameState = "menu"
      
		-- Fonts --
      font = love.graphics.newFont("Fonts/advanced_pixel-7.ttf", 15)
      menuFont1 = love.graphics.newFont("Fonts/sugarpunch-demo.regular.otf", 40)
      menuFont2 = love.graphics.newFont("Fonts/sugarpunch-demo.regular.otf", 39)
      Scorefont = love.graphics.newFont("Fonts/sugarpunch-demo.regular.otf", 30)
      
		-- Audio --    
			--local Music = love.audio.newSource('Audio/GB.mp3')
  		--Music:setLooping(true)
 			--Music:play()
      
    -- Sprites --
 			-- Background --        
 				background1 = love.graphics.newImage("Sprites/bg1.png")        
        backgroundQuad = love.graphics.newQuad(1,1,720/2,1280/2,720/2,1280/2)
        
        menuBackground = love.graphics.newImage("Sprites/menuBG.png")        
        menuBackgroundQuad = love.graphics.newQuad(1,1,720/2,1280/2,720/2,1280/2)
        
        sky1X = 1
        sky2X = 360
        skyY  = 1
        
        sky              = love.graphics.newImage("Sprites/sky.png") 
        sky1             = love.graphics.newImage("Sprites/sky1.png") 
        sky2             = love.graphics.newImage("Sprites/sky2.png") 
        
 			-- Player --
        playerHand        = love.graphics.newImage("Sprites/playerHand.png")
        cauldron          = love.graphics.newImage("Sprites/Cauldron.png")
        
        angle = 0 
        pumpkinAngle = 0
        speed = 100
        
        pumpkinChomp      = love.graphics.newImage("Sprites/pumpkinChomp_01.png") 
        pumpkinFemale     = love.graphics.newImage("Sprites/pumpkinFemale_01.png") 
        pumpking          = love.graphics.newImage("Sprites/pumpking_01.png") 
        pumpkinMale       = love.graphics.newImage("Sprites/pumpkinMale_01.png") 
        pumpkinRage       = love.graphics.newImage("Sprites/pumpkinRage_01.png") 
        
        pumpkinX     = math.random(-100, 460)        
        pumpkinY     = math.random(-50, 10)
                
        marker = love.graphics.newImage("Sprites/marker.png")
        markerX = 180
        markerY = 450

 			-- Menu UI --     
        love.graphics.setBackgroundColor(255, 255, 255)
      
        button_spawn(85, 200, "Start Game", "start")
        button_spawn(30, 250, "Choose Character", "characterSelect")
        button_spawn(110, 300, "Options", "options")
        button_spawn(95, 350, "Quit Game", "quit")        
          
        optionsbutton_spawn(90, 200, "Difficulty", "boom")
        optionsbutton_spawn(105, 250, "Pumpkin", "options")
        optionsbutton_spawn(135, 300, "Back", "back")
        optionsbutton_spawn(135, 350, "Test", "test")
        
        charbutton_spawn(85, 165, "Chomp", "chomp")
        charbutton_spawn(85, 215, "M' Lady", "lady")
        charbutton_spawn(85, 265, "Pumpking", "pumpking")
        charbutton_spawn(85, 315, "Happy Dude", "happy")
        charbutton_spawn(85, 365, "Captain Salt", "salt")
        
      -- Score UI --
      
       	lives = love.graphics.newImage("Sprites/lives1.png")        
        score = 0
        scoreX = 200

 			-- Game Over UI --

end

function love.draw()  
  if gameState == "game" then 
    game_screen(pumpkinSet)
    
  elseif gameState == "menu" then
    game_menu()
  
  elseif gameState == "options" then
    game_options()
    
  elseif gameState == "characterSelect" then
    character_select()
    
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
  love.graphics.draw(menuBackground, menuBackgroundQuad, 0, -1)
  love.graphics.print( "Gamestate: ".. gameState, 10, 10 )
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
   
  if key == "p" then
    gameState = "menu"
  end
end

function love.mousepressed(x, y)
  if gameState == "menu" then
    button_click(x, y)
  elseif gameState == "options" then    
    optionsbutton_click(x, y)
  elseif gameState == "characterSelect" then
    charbutton_click(x, y)
  end
end
function love.update(dt)  
  mouse_x = love.mouse.getX()
  mouse_y = love.mouse.getY()  
  
  if gameState == "menu" then
    button_check()
  elseif gameState == "options" then
    optionsbutton_check()
  elseif gameState == "characterSelect" then
    charbutton_check()
  end
  
  -- For Debug --
  score = score + 1
  love.graphics.rotate( 1 )
  
  angle = math.angle (markerX, markerY, pumpkinX, pumpkinY) 
  angle = angle + math.pi*.5
  
  -- calculate angle from enemy to player
  
  pumkinAngle = math.angle(pumpkinX, pumpkinY, markerX, markerY)
   -- work out how much x and y will change in this step
   -- math.cos and math.sin will be between -1 and +1
   -- multiplying by (dt*speed) means the enemy will move speed pixels in one whole second
   local dx = math.cos(pumkinAngle) * (dt * speed)
   local dy = math.sin(pumkinAngle) * (dt * speed)
   -- move to our new x and y
   pumpkinX = pumpkinX + dx
   pumpkinY = pumpkinY + dy
  
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

  if pumpkinY > 640 then
    pumpkinY    = math.random(-50, 10)
    pumpkinX    = math.random(-100, 460)
  end
  
end