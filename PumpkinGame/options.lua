function game_options()
  love.graphics.draw(menuBackground, menuBackgroundQuad, 0, -1)  
  love.graphics.print( "Gamestate: ".. gameState, 10, 10 )
  
  optionsbutton_draw()
end