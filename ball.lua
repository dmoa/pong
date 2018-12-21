function ballUpdate()

  ballx = ballx + ballxv
  bally = bally + ballyv


  --so the ball doesn't freak out at high speeds
  if bally + balllength >= playery and bally <= playery + playerHeight then
    if ballx + ballxv < playerx + playerWidth and ballx + ballxv + balllength > playerx then
      ballx = playerx + playerWidth
      print("saving the day")
    end
  end

  --if paddle pushes on ball vertically
  if ballx < playerx + playerWidth and
  ballx + balllength > playerx then
    if bally + balllength >= playery and
    bally + balllength <= playery + playerHeight / 2 then
      bally = playery - balllength
      print("pushback")
    end
    if bally < playery + playerHeight and
    bally + balllength > playery + playerHeight / 2 then
      bally = playery + playerHeight
      print("pushback")
    end
  end

  --bouncing off top and side of paddle
  if ballx < playerx + playerWidth and
  ballx + balllength > playerx and
  ((bally + balllength >= playery and
    bally + balllength <= playery + playerHeight / 2) or
    (bally <= playery + playerHeight and
  bally + balllength >= playery + playerHeight / 2)) then
    ballyv = ballyv * - 1
  else
    if ballx <= playerx + playerWidth and
    ballx + balllength >= playerx and
    bally + balllength >= playery and
    bally <= playery + playerHeight then

      if score % 10 == 9 then
        love.audio.play(bounce10)
      else
        love.audio.play(bounce)
      end

      score = score + 1
      ballxv = ballxv * - 1
      mainText:setf(score, love.graphics.getWidth(), "left")

      if ballxv < 0 then
        ballxv = ballxv - speedInc
      else
        ballxv = ballxv + speedInc
      end
      if ballyv < 0 then
        ballyv = ballyv - speedInc
      else
        ballyv = ballyv + speedInc
      end

    end
  end

  --wall bounces
  if bally <= 0 or bally + balllength >= love.graphics.getHeight() then
    ballyv = ballyv * - 1
  end

  if ballx + balllength > love.graphics.getWidth() then
    ballxv = ballxv * - 1
  end

  -- if ball has gone out
  if ballx < - 20 then
    playingGame = false
    love.audio.play(fail)
    mainText:setf("PRESS ENTER TO TRY AGAIN", love.graphics.getWidth(), "left")
  end
end
