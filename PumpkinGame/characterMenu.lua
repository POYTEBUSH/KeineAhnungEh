charbutton = {}

function charbutton_spawn(x, y, text, id)
  table.insert(charbutton, {x = x, y= y, text = text, id = id})
end

function charbutton_draw()
  for i, v in ipairs(charbutton) do    
    if v.mouseover == false then
      love.graphics.setColor(255, 77, 0)
      love.graphics.setFont(menuFont2)
    end
    if v.mouseover == true then
      love.graphics.setColor(204, 62, 0)
      love.graphics.setFont(menuFont1)      
    end
    
    love.graphics.print(v.text, v.x, v.y)
    love.graphics.setColor(255,255,255)
  end
end

function charbutton_click(x, y)
  for i, v in ipairs(charbutton) do
    if x > v.x and
      x < v.x + Scorefont:getWidth(v.text) and
      y > v.y and 
      y < v.y + Scorefont:getHeight() then
        if v.id == "chomp" then
          pumpkinSet = "pumpkinChomp"
          gameState = "game"
        elseif v.id == "lady" then
          pumpkinSet = "pumpkinFemale"
          gameState = "game"
        elseif v.id == "pumpking" then
          pumpkinSet = "pumpking"
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
      mouse_x < v.x + Scorefont:getWidth(v.text) and
      mouse_y > v.y and 
      mouse_y < v.y + Scorefont:getHeight() then
        v.mouseover = true
      else 
        v.mouseover = false
    end
  end
end