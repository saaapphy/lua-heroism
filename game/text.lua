-- This will probably be the main part of the game, getting all info. Default font is set to Open Sans PX, but can be changed to any font.
local text = {}

local textXoffset


function text.init()
  --standard procedure for making a textbox
  text.font = love.graphics.newFont("assets/fonts/OpenSansPX.ttf", 24)

  text.width = 400
  text.height = 64
  text.sep = 12
  text.border = 8
  text.lineWidth = text.width - text.border * 2

  --the actual text
  text.page = 1
  text.pageNumber = 0
  text.text = {
    "Hai. OwO",
    "This is a test of the text system. It's not perfect, but it's a start. :3",
    "I hope you like it. :D",
    "I'm going to keep talking until you press enter. :P",
  }

  -- Ensure textLength is initialized as a table
  text.textLength = {}
  text.textLength[1] = string.len(text.text[1])
  text.drawChar = 0
  text.textSpeed = 1
  text.setup = false
  text.boxX = 100
  text.boxY = 400
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

  if text.page <= text.pageNumber+1 then
    text.keypressed();
  end
  if text.page <= text.pageNumber then --draw the text box
    love.graphics.rectangle("line", text.boxX, text.boxY, text.width, text.height)

    --draw the text
    local textToDraw = string.sub(text.text[text.page], 1, text.drawChar)
    love.graphics.printf(textToDraw, text.boxX + text.border, text.boxY + text.border, text.lineWidth, "left")
end
  
  love.graphics.printf("This is a test lol.", text.boxX-100 + text.border, text.boxY-100 + text.height - text.sep, text.lineWidth, "left")
end

--flipping pages
function text.keypressed(key)
  if key == "return" then
    if text.drawChar == text.textLength[text.page] then

      
      --next page
      if text.page < text.pageNumber or text.page == 1 then
        text.page = text.page + 1
        text.drawChar = 0
          
        --destroy the text box
      else
        --nothing?
      end
    else
      --finish the text
      text.drawChar = text.textLength[text.page]
    end
  end
end

function text.mousepressed(x, y, button, istouch, presses)
  --this does not do anything lol
end

-- we return the object
return text
