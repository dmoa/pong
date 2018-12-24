function playerUpdate(dt)
  if love.keyboard.isDown("up") then
    playery = playery - (playerspeed * dt)
  end
  if love.keyboard.isDown("down") then
    playery = playery + (playerspeed * dt)
  end
  if playery <= 0 then
    playery = 0
  end
  if playery + playerHeight > love.graphics.getHeight() then
    playery = love.graphics.getHeight() - playerHeight
  end
end
