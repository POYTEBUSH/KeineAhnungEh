function love.conf(c)
  c.title = "Pumpkin Game"
  local window = c.screen or c.window -- love 0.9 renamed "screen" to "window"
  window.width = 1000/2
  window.height = 1000/2
end