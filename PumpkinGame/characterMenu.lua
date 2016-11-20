charbutton = {}

function charbutton_spawn(x, y, text, id)
  table.insert(charbutton, {x = x, y= y, text = text, id = id})
end

function charbutton_draw()
  for i, v in ipairs(charbutton) do    
    if v.mouseover == false then
      love.graphics.setColor(255, 77, 0)
      love.graphics.setFont(font.menu2)
    end
    if v.mouseover == true then
      love.graphics.setColor(204, 62, 0)
      love.graphics.setFont(font.menu1)      
    end
    
    love.graphics.print(v.text, v.x, v.y)
    love.graphics.setColor(255,255,255)
  end
end

function charbutton_click(x, y)
  for i, v in ipairs(charbutton) do
    if x > v.x and
      x < v.x + font.score:getWidth(v.text) and
      y > v.y and 
      y < v.y + font.score:getHeight() then
        if v.id == "chomp" then
          pumpkinSet = "pumpkinChomp"
          gameState = "game"
        elseif v.id == "lady" then
          pumpkinSet = "pumpkinFemale"
          gameState = "game"
        elseif v.id == "pumpkinKing" then
          pumpkinSet = "pumpkinKing"
          gameState = "game"
        elseif v.id == "happy" then
          pumpkinSet = "pumpkinMale"
          gameState = "game"
        elseif v.id == "salt" then
          pumpkinSet = "pumpkinRage"
          gameState = "game"
        end
    end  
  end
end

function charbutton_check()
  for i, v in ipairs(charbutton) do
    if mouse_x > v.x and
      mouse_x < v.x + font.score:getWidth(v.text) and
      mouse_y > v.y and 
      mouse_y < v.y + font.score:getHeight() then
        v.mouseover = true
      else 
        v.mouseover = false
    end
  end
end