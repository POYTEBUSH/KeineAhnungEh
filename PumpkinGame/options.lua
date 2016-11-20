function game_options()
  love.graphics.draw(background.menu.sprite, background.menu.quad, 0, -1)  
  love.graphics.print( "Gamestate: ".. gameState, 10, 10 )
  
  optionsbutton_draw()
end