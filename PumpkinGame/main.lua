require "menu"
require "game"
require "optionsMenu"
require "options"
require "characterSelect"
require "characterMenu"
require "collison"

function love.load()
  start = 0
  
	-- Load --
    math.randomseed(os.time())
    pumpkinSet = "pumpkinMale"
  
	-- Game States --
		gameState = "menu"
    --
      
	-- Fonts --
    font = {}
    font.normal = love.graphics.newFont("Fonts/advanced_pixel-7.ttf", 15)
    font.menu1 = love.graphics.newFont("Fonts/sugarpunch-demo.regular.otf", 40)
    font.menu2 = love.graphics.newFont("Fonts/sugarpunch-demo.regular.otf", 39)
    font.score = love.graphics.newFont("Fonts/sugarpunch-demo.regular.otf", 30)
      
	-- Audio --    
		--local Music = love.audio.newSource('Audio/GB.mp3')
  	--Music:setLooping(true)
 		--Music:play()
      
  -- Sprites --
 		-- Background --
      background = {}
      background.one = {}
 			background.one.sprite = love.graphics.newImage("Sprites/bg1.png")        
      background.one.quad = love.graphics.newQuad(1,1,720/2,1280/2,720/2,1280/2)
        
      background.menu = {}
      background.menu.sprite = love.graphics.newImage("Sprites/menuBG.png")        
      background.menu.quad = love.graphics.newQuad(1,1,720/2,1280/2,720/2,1280/2)
      
      background.sky = {}
      background.sky.sprite1 = love.graphics.newImage("Sprites/sky.png") 
      background.sky.sprite2 = love.graphics.newImage("Sprites/hills.png") 
      background.sky.sprite3 = love.graphics.newImage("Sprites/hills1.png") 
      background.sky.sprite4 = love.graphics.newImage("Sprites/hills2.png") 
      background.sky.x1       = 0
      background.sky.x2       = 600
      background.sky.y        = 1
      background.sky.bhills1x = 0
      background.sky.bhills2x = 600
      background.sky.bhillsY  = 100
      background.sky.hills1x  = 0
      background.sky.hills2x  = 600
      background.sky.hillsY   = 15
      background.sky.fhills1x  = 0
      background.sky.fhills2x  = 600
      background.sky.fhillsY   = 15
      
      background.trees = {}
      background.trees.sprite1 = love.graphics.newImage("Sprites/tree1.png") 
      --background.trees.sprite2 = love.graphics.newImage("Sprites/tree2.png")
      
      background.fence = {}
      background.fence.sprite1 = love.graphics.newImage("Sprites/fence.png") 

      sky1X = 0
      sky2X = 600
      skyY  = 1
      
      btree1X = 0
      btree2X = 360
      btreeY = 15
      
      fence1X = 0
      fence2X = 360
      fenceY = 225
        
 		-- Player --
      playerHand = love.graphics.newImage("Sprites/playerHand.png")
      cauldron = love.graphics.newImage("Sprites/Cauldron.png")
      angle = 0 

    -- Pumpkins -- 
      pumpkin = {}
      -- Bounce
        pumpkin.bounce = 0
        pumpkin.bounce2 = 0
      -- Speed
        pumpkin.speed = 200
        pumpkin.speed2 = 200
      -- Angle
        pumpkin.angle = 0
        pumpkin.angle2 = 0
      -- X
        pumpkin.X = math.random(-100, 460) 
        pumpkin.X2 = math.random(-100, 460) 
      -- Y
        pumpkin.Y = math.random(-50, 10)
        pumpkin.Y2 = math.random(-50, 10)
      pumpkin.W = 50
      pumpkin.H = 50
      
      -- Chomp --
        pumpkin.Chomp = {}
        pumpkin.Chomp.sprite = love.graphics.newImage("Sprites/pumpkinChomp_01.png")
      -- Female ---
        pumpkin.Female = {}
        pumpkin.Female.sprite = love.graphics.newImage("Sprites/pumpkinFemale_01.png")
      -- King --
        pumpkin.King = {}
        pumpkin.King.sprite = love.graphics.newImage("Sprites/pumpking_01.png")
      -- Male --
        pumpkin.Male = {}
        pumpkin.Male.sprite = love.graphics.newImage("Sprites/pumpkinMale_01.png")
      -- Rage --
        pumpkin.Rage = {}
        pumpkin.Rage.sprite = love.graphics.newImage("Sprites/pumpkinRage_01.png")
    
    -- Marker --
      marker = {}
      marker.sprite = love.graphics.newImage("Sprites/marker.png")
      marker.X = 180
      marker.Y = 450
      marker.W = 30
      marker.H = 30
      
    -- Score -- 
      score = {}      
      score.value = 0
      score.display = {}
      score.display.x = 0
      score.display.y = 0      
      
      life = {}  
      life.value = 3       

 		-- Menu UI --     
      love.graphics.setBackgroundColor(255, 255, 255)
      
      button_spawn(85, 200, "Start Game", "start")
      button_spawn(30, 250, "Choose Character", "characterSelect")
      --button_spawn(110, 300, "Options", "options")
      button_spawn(95, 300, "Quit Game", "quit")        
          
      optionsbutton_spawn(90, 200, "Difficulty", "boom")
      optionsbutton_spawn(105, 250, "Pumpkin", "options")
      optionsbutton_spawn(135, 300, "Back", "back")
      optionsbutton_spawn(135, 350, "Test", "test")
      
      charbutton_spawn(85, 165, "Chomp", "chomp")
      charbutton_spawn(85, 215, "M' Lady", "lady")
      charbutton_spawn(85, 265, "Pumpking", "pumpkinKing")
      charbutton_spawn(85, 315, "Happy Dude", "happy")
      charbutton_spawn(85, 365, "Captain Salt", "salt")
        
    -- Score --
      lives = love.graphics.newImage("Sprites/lives1.png") 
      --

 		-- Game Over UI --
    
end

function love.draw()
  if gameState == "game" then 
    game_screen(pumpkinSet)
    
  elseif gameState == "menu" then
    game_menu()
    life.value = 3
    love.mouse.setVisible(true)
  
  elseif gameState == "options" then
    game_options()
    
  elseif gameState == "characterSelect" then
    character_select()
    
  elseif gameState == "gameover" then
    love.graphics.print( "Mouse X: ".. mouse_x .. " Mouse Y: " .. mouse_y .. " Mouse Clicks: " .. mouseclicks, 10, 10 )
    love.graphics.print(score, 190, 218)
    game_over()
  end
end

function math.angle(x1, y1, x2, y2)
  return math.atan2(y2 - y1, x2 - x1)
end

function game_menu()
  love.graphics.draw(background.menu.sprite, background.menu.quad, 0, -1)
  love.graphics.print( "Gamestate: ".. gameState, 10, 10 )
  button_draw()
end

function love.keypressed(key)
   if key == "tab" then
      local state = not love.mouse.isVisible()   -- the opposite of whatever it currently is
      love.mouse.setVisible(state)
   end
   
  if key == "p" then
    gameState = "menu"
  end
  
  if key == "=" then
    life.value = life.value - 1
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
  score.value = score.value + 1
  love.graphics.rotate( 1 )
  
  angle = math.angle (marker.X, marker.Y, pumpkin.X, pumpkin.Y) 
  angle = angle + math.pi*.5
  
  -- calculate angle from enemy to player
  if start == 0 then
    pumpkin.angle = math.angle(pumpkin.X, pumpkin.Y, marker.X, marker.Y)
    pumpkin.angle2 = math.angle(pumpkin.X, pumpkin.Y, marker.X, marker.Y)
    start = 1
  end
  
   -- work out how much x and y will change in this step
   -- math.cos and math.sin will be between -1 and +1
   -- multiplying by (dt*pumpkin.speed) means the enemy will move speed pixels in one whole second
   local dx = math.cos(pumpkin.angle) * (dt * pumpkin.speed)
   local dx2 = math.cos(pumpkin.angle2) * (dt * pumpkin.speed2)
   local dy = math.sin(pumpkin.angle) * (dt * pumpkin.speed)
   local dy2 = math.sin(pumpkin.angle2) * (dt * pumpkin.speed2)
   -- move to our new x and y
   pumpkin.X = pumpkin.X + dx
   pumpkin.X2 = pumpkin.X2 + dx2
   pumpkin.Y = pumpkin.Y + dy
   pumpkin.Y2= pumpkin.Y2 + dy2
  
  -- To stop the score text overlaping the lives sprites --
  if score.value >= 10 then
    score.X = 185
  end
  if score.value >= 100 then
    score.X = 170
  end
  if score.value >= 1000 then
    score.X = 150
  end
  
  if pumpkin.Y > 640 then
    pumpkin.Y = math.random(-50, 10)
    pumpkin.X = math.random(-100, 460)
  elseif pumpkin.Y < -100 then
    pumpkin.Y = math.random(-50, 10)
    pumpkin.X = math.random(-100, 460)
    pumpkin.speed = 200
    pumpkin.angle = math.angle(pumpkin.X, pumpkin.Y, marker.X, marker.Y)
    pumpkin.bounce = 0
  end
  
  if pumpkin.Y2 > 640 then
    pumpkin.Y2 = math.random(-50, 10)
    pumpkin.X2 = math.random(-100, 460)
  elseif pumpkin.Y2 < -100 then
    pumpkin.Y2 = math.random(-50, 10)
    pumpkin.X2 = math.random(-100, 460)
    pumpkin.speed2 = 200
    pumpkin.angle2 = math.angle(pumpkin.X2, pumpkin.Y2, marker.X, marker.Y)
    pumpkin.bounce2 = 0
  end
end
