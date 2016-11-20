button = {}

function button_spawn(x, y, text, id)
  table.insert(button, {x = x, y= y, text = text, id = id})
end

function button_draw()
  for i, v in ipairs(button) do
    if v.mouseover == false then
      love.graphics.setColor(255, 77, 0)
      love.graphics.setFont(font.menu2)
    end
    if v.mouseover == true then
      love.graphics.setColor(204, 62, 0)
      love.graphics.setFont(font.menu2)      
    end
    
    love.graphics.print(v.text, v.x, v.y)
    love.graphics.setColor(255,255,255)
  end
end

function button_click(x, y)
  for i, v in ipairs(button) do
    if x > v.x and
      x < v.x + font.score:getWidth(v.text) and
      y > v.y and 
      y < v.y + font.score:getHeight() then
        if v.id == "quit" then
          love.event.push("quit")
        elseif v.id == "start" then
          gameState = "game"
        elseif v.id == "options" then
          gameState = "options"   
        elseif v.id == "characterSelect" then
          gameState = "characterSelect"
        end
    end  
  end
end

function button_check()
  for i, v in ipairs(button) do
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