function love.load()
	-- Load --
		-- Game States --
			-- 1 = menu, 2 = game, 3 = game over
			gameState = 1
		-- Score -- 
			score = 0
			scoreDisplay = {}
  			scoreDisplay.x = 0
 			scoreDisplay.y = 0
		-- Text --
			medium = love.graphics.newFont(40)
			--
		-- Audio --
			local Music = love.audio.newSource('Audio/GB.mp3')
  			Music:setLooping(true)
 			Music:play()
 		-- Sprites --
 			-- Background --
 				background = love.graphics.newImage("Sprites/bg.png")
 				--
 			-- Player --

 			-- Pumpkins --

 			-- Main Menu UI --

 			-- Menu UI --

 			-- Score UI --

 			-- Game Over UI --

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

function love.draw()
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.setFont(medium)
	-- Drawing --
		-- Game State 1 - Menu --
			if gameState == 1 then
			-- Background --
				love.graphics.draw(background)
			-- Main Menu UI --

			end
		-- Game State 2 - Game --
			if gameState == 2 then
			-- Background --
				love.graphics.draw(background)
			-- Player --

			-- Pumpkins --

			-- Score UI --

			-- Menu UI --

			end
		-- Game State 3 - Over --
			if gameState == 3 then
		 	-- Background --
				love.graphics.draw(background, backgroundQuad, 0, 0)
		 	-- Game Over UI --

		 	end

end