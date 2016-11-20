optionsbutton = {}

function optionsbutton_spawn(x, y, text, id)
  table.insert(optionsbutton, {x = x, y= y, text = text, id = id})
end

function optionsbutton_draw()
  for i, v in ipairs(optionsbutton) do 
    if v.mouseover1 == false then
      love.graphics.setColor(255, 77, 0)
      love.graphics.setFont(font.menu2)
    end
    if v.mouseover1 == true then
      love.graphics.setColor(204, 62, 0)
      love.graphics.setFont(font.menu1)      
    end
    
    love.graphics.print(v.text, v.x, v.y)
    love.graphics.setColor(255,255,255)
  end
end

function optionsbutton_click(x, y)
  for i, v in ipairs(optionsbutton) do
    if x > v.x and
      x < v.x + font.score:getWidth(v.text) and
      y > v.y and 
      y < v.y + font.score:getHeight() then
        if v.id == "back" then
          gameState = "menu"
        elseif v.id == "test" then
          gameState = "game" 
        elseif v.id == "boom" then
          gameState = "game" 
        end
    end  
  end
end

function optionsbutton_check()
  for i, v in ipairs(optionsbutton) do
    if mouse_x > v.x and
      mouse_x < v.x + font.score:getWidth(v.text) and
      mouse_y > v.y and 
      mouse_y < v.y + font.score:getHeight() then
        v.mouseover1 = true
      else 
        v.mouseover1 = false
    end
  end
end