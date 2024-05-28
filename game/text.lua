-- This will probably be the main part of the game, getting all info. Default font is set to Open Sans PX, but can be changed to any font.
local text = {}

local textXoffset

function text.init()
  --standard procedure for making a textbox
  text.font = love.graphics.newFont("assets/fonts/OpenSansPX.ttf", 24)
  text.boxSprite = love.graphics.newImage("assets/sprites/textbox/spr_textbox.png")
  text.width = 200
  text.height = 64
  text.sep = 12
  text.border = 8
  text.lineWidth = text.width - text.border * 2

  --the actual text
  text.page = 1
  text.pageNumber = 0
  text.text = {
    "Hai. OwO"
  }

  -- Ensure textLength is initialized as a table
  text.textLength = {}
  text.textLength[1] = string.len(text.text[1])
  text.drawChar = 0
  text.textSpeed = 1
  text.setup = false
  text.boxX = 0
  text.boxY = 0
end

function text.draw()
  --setup idea
  if text.setup == false then
    text.setup = true
    love.graphics.setFont(text.font)
    text.pageNumber = #text.text

    for i = 1, text.pageNumber do
      --the actual definition of textLength
      text.textLength[i] = string.len(text.text[i])

      --get position of the box
      if not textXoffset then
        textXoffset = {}
      end
      textXoffset[i] = -100
    end
  end

  if text.drawChar < text.textLength[text.page] then
    text.drawChar = text.drawChar + text.textSpeed
    text.drawChar = math.clamp(text.drawChar, 0, text.textLength[text.page])
  end

  --flipping pages
  if love.keyboard.isDown("return") then
    if text.drawChar == text.textLength[text.page] then
      --next page
      if text.page < text.pageNumber - 1 then
        text.page = text.page + 1
        text.drawChar = 0
        --destroy the text box
      else
        text.boxSprite:release()
      end
    else
      --finish the text
      text.drawChar = text.textLength[text.page]
    end
  end

  --draw the text box
  love.graphics.draw(text.boxSprite, text.boxX, text.boxY, 0, 20, 10, textXoffset[text.page])

  --draw the text
  local textToDraw = string.sub(text.text[text.page], 1, text.drawChar)
  love.graphics.printf(textToDraw, text.boxX + text.border, text.boxY + text.border, text.lineWidth, "left")
end

-- we return the object
return text
