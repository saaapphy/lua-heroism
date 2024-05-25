saveMgr = require("game.saveManager")

local newGame = {}

local buttons = {}
local titleFont
local buttonFont

function newGame.init()
  titleFont = love.graphics.newFont(32)
  buttonFont = love.graphics.newFont(24)
  local buttonWidth = 200
  local buttonHeight = 50
  local buttonSpacing = 20
  local buttonMargin = 50
  local startY = 200
  -- Total height + spacing
  local totalHeight = (buttonHeight + buttonSpacing) * 3 - buttonSpacing
  -- Declare buttonX for right-alignment
  local buttonX = 800 - buttonMargin - buttonWidth

  -- List of names
  local buttonNames = {"Identity", "Difficulty", "OK?"}

  -- Once declared and all that, we draw with a for loop
  for i, name in ipairs(buttonNames) do
    table.insert(buttons, {
      text = name,
      x = buttonX,
      y = startY + (i - 1) * (buttonHeight + buttonSpacing),
      width = buttonWidth,
      height = buttonHeight,
      action = function()
        if name == "Identity" then
          print(name)
        elseif name == "Difficulty" then
          print(name)
        elseif name == "OK?" then
          print(name)
        else
          print(name .. " button was pressed")
        end
      end
    })
  end

  -- This function handles both init and drawing
end

function newGame.draw()
  
  -- Although this may be slow...
  love.graphics.setFont(titleFont)
  love.graphics.printf("Lua-Herosim", 0, 50, 800, "center")

  -- NOTE: "_" is somtimes used as a placeholder in loops
  -- This loop is responsible for drawing our buttons to the window
  love.graphics.setFont(buttonFont)
  for _, button in ipairs(buttons) do
    love.graphics.rectangle("line", button.x, button.y, button.width, button.height)
    love.graphics.printf(button.text, button.x, button.y + (button.height / 4), button.width, "center")
  end

end

function newGame.mousepressed(x, y, button, istouch, presses)
end

return newGame