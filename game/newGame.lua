saveMgr = require("game.saveManager")

local newGame = {}

-- I know the function name is long
-- Better to be hyper-specific than super vague
function newGame.createCharacterAndChooseDifficulty()
  print("Test!")
end

function newGame.drawButtons()
  local buttonWidth = 200
  local buttonHeight = 50
  local buttonSpacing = 20
  local buttonMargin = 20
  local startY = 200

  -- Total height + spacing
  local totalHeight = (buttonHeight + buttonSpacing) * 3 - buttonSpacing

  -- Declare buttonX for right-alignment
  local buttonX = 800 - buttonMargin - buttonWidth

  -- List of names
  local buttonNames = {"Identity", "Difficulty", "OK?"}

  -- Once declared and all that, we draw with a for loop
  for i, name in ipairs(buttonNames) do
    local buttonY = startY + (i - 1) * (buttonHeight + buttonSpacing)
    love.graphics.rectangle("line", buttonX, buttonY, buttonWidth, buttonHeight)
    love.graphics.printf(name, buttonX, buttonY, buttonWidth, buttonHeight)
  end
end

return newGame