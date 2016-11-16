function character_select()
  love.graphics.draw(menuBackground, menuBackgroundQuad, 0, -1)  
  love.graphics.setFont(Scorefont)
  love.graphics.print( "Choose your character: ", 15, 50)
  
  love.graphics.draw(pumpkinChomp, 20, 150)
  love.graphics.draw(pumpkinFemale, 20, 200)
  love.graphics.draw(pumpking, 20, 250)
  love.graphics.draw(pumpkinMale, 20, 300)
  love.graphics.draw(pumpkinRage, 20, 350)
  
  charbutton_draw()
end  