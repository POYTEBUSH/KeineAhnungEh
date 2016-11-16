button = {}

function button_spawn(x, y, text, id)
  table.insert(button, {x = x, y= y, text = text, id = id})
end

function button_draw()
  for i, v in ipairs(button) do
    love.graphics.setColor(0,0,0)
    love.graphics.setFont(Scorefont)
    love.graphics.print(v.text, v.x, v.y)
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
    if mouse_x> v.x and
      mouse_x < v.x + Scorefont:getWidth(v.text) and
      mouse_y > v.y and 
      mouse_y < v.y + Scorefont:getHeight() then
  end
end