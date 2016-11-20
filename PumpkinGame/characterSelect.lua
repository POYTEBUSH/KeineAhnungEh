function character_select()
  love.graphics.draw(background.menu.sprite, background.menu.quad, 0, -1)  
  love.graphics.setFont(font.score)
  love.graphics.print( "Choose your character: ", 15, 50)
  
  love.graphics.draw(pumpkin.Chomp.sprite, 20, 150)
  love.graphics.draw(pumpkin.Female.sprite, 20, 200)
  love.graphics.draw(pumpkin.King.sprite, 20, 250)
  love.graphics.draw(pumpkin.Male.sprite, 20, 300)
  love.graphics.draw(pumpkin.Rage.sprite, 20, 350)
  
  charbutton_draw()
end  