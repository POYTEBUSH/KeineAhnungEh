button = {}

function button_spawn(x, y, text, id)
  table.insert(button, {x = x, y= y, text = text, id = id})
end

function button_draw()
  for i, v in ipairs(button) do    
    if v.mouseover == false then
      love.graphics.setColor(255, 77, 0)
      love.graphics.setFont(menuFont2)
    end
    if v.mouseover == true then
      love.graphics.draw(bigtroll, 60, 150)
      love.graphics.setColor(204, 62, 0)
      love.graphics.setFont(menuFont1)      
    end
    
    --love.graphics.setFont(menuFont1)
    love.graphics.print(v.text, v.x, v.y)
    love.graphics.setColor(255,255,255)
  end
end

function button_click(x, y)
  for i, v in ipairs(button) do
    if x > v.x and
      x < v.x + Scorefont:getWidth(v.text) and
      y > v.y and 
      y < v.y + Scorefont:getHeight() then
        if v.id == "quit" then
          love.event.push("quit")
        elseif v.id == "start" then
          gameState = "game" 
        end
    end  
  end
end

function button_check()
  for i, v in ipairs(button) do
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