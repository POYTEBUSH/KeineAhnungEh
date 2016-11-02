button = {}

function button_spawn(x, y, text)
    table.insert(button, {x = x, y= y, text = text, id = id})
end

function button_draw()
    for i, v in ipairs(button) do
        love.graphics.setColor(0,0,0)
        love.graphics.setFont(medium)
        love.graphics.print(v.text, v.x, v.y)
    end
end

function button_click(x, y)
    for i, v in ipairs(button) do
        if x > v.x and
        if x > v.x + v.medium:getWidth() and
        if x > v.y and
        if x > v.y + v.medium:getHeight() then
            if v.id == "quit" then
                love..event.push("quit")
            if v.id == "start" then
                gameState = "playing"
            end                        
        end
    end    
end