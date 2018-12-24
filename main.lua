require("ball")
require("player")

function love.load()

  playingGame = false

  defaultfont = love.graphics.newFont(20)
  mainText = love.graphics.newText(defaultfont, "PRESS ENTER TO START")

  score = 0

  bounce = love.audio.newSource("bounce.wav", "static")
  bounce10 = love.audio.newSource("bounce10.wav", "static")
  fail = love.audio.newSource("fail.wav", "static")

  playerWidth = 10
  playerHeight = 80
  playerx = 50
  playery = love.graphics.getHeight() / 2 - playerHeight / 2
  playerspeed = 200

  balllength = 10
  ballx = love.graphics.getWidth() / 2 - balllength / 2
  bally = love.graphics.getHeight() / 2 - balllength / 2
  ballxv = - 100
  ballyv = -100
end


function love.draw()
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth() + 5, love.graphics.getHeight())

  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(mainText, love.graphics.getWidth() / 2 - mainText:getWidth() / 2,
  love.graphics.getHeight() / 2 - mainText:getHeight() / 2)

  if playingGame == true then
    love.graphics.setColor(255, 255, 255);
    love.graphics.rectangle("fill", playerx, playery, playerWidth, playerHeight)
    love.graphics.rectangle("fill", ballx, bally, balllength, balllength)
  end

end


function love.update(dt)

  if playingGame then
    ballUpdate(dt)
    playerUpdate(dt)
  end

  if love.keyboard.isDown("return") and playingGame == false then
    score = 0
    mainText:setf(score, love.graphics.getWidth(), "left")
    playingGame = true
    playery = love.graphics.getHeight() / 2 - playerHeight / 2
    ballx = love.graphics.getWidth() / 2 - balllength / 2
    bally = love.graphics.getHeight() / 2 - balllength / 2
    ballxv = - 100
    ballyv = -100
    print("restarting")
  end

end
