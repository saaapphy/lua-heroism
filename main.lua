-- This file only handles the main menu and its functions
-- Anything else should be moved into its own file in the "game" dir

local buttons = {}
local titleFont
local buttonFont

local ng = require("game.newGame")

function love.load()
  -- Here we can start actually building the window
  -- This sets it to 800x600 and enables vsync for consisent feel across machines
  love.window.setVSync(1)
 
  -- Also just before loading, we push a little message noting that
  -- this is still a WIP and is not prod ready at all
  local devWarnMessage = love.window.showMessageBox("Quick notice!", "This is still a WIP project. This may or may not be playable or smooth.\nBugs or crashes should be reported on our GitHub!", "warning", false)
  local devShowGitHub = love.window.showMessageBox("GitHub Repository", "https://github.com/saaapphy/lua-heroism/", "info", false)

  -- After the warning and behind the scenes, the window actually gets loaded
  titleFont = love.graphics.newFont(32)
  buttonFont = love.graphics.newFont(24)

  local buttonWidth = 200
  local buttonHeight = 50
  local buttonX = (800 - buttonWidth) / 2
  local startY = 200
  local spacing = 20

  -- Declare the buttons we use and run a loop to insert them into buttons{} table
  local buttonNames = {"New Game", "Load Game", "Settings", "Quit"}

  -- This absolute mess of a loop inserts the name, position, dimensions and action of each button
  -- into the original button table declared at the start of the script
  for i, name in ipairs(buttonNames) do
    table.insert(buttons, {
      text = name,
      x = buttonX,
      y = startY + (i - 1) * (buttonHeight + spacing),
      width = buttonWidth,
      height = buttonHeight,
      action = function()
        if name == "New Game" then
          newGameClicked()
        end
        if name == "Load Game" then
          loadGameClicked()
        end
        if name == "Settings" then
          love.window.showMessageBox("Sorry...", "This functionality has not yet been implemented.\nWe apologize for this inconvenience.", "error", false)
        end
        if name == "Quit" then
          love.event.quit()
        else
          print(name .. " button was pressed")
        end
      end
    })
  end
end

-- After all that loading mess, we can finally draw to the screen!
function love.draw()
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

-- This listens for any kind of mouse click/press input
function love.mousepressed(x, y, button, istouch, presses)
  -- button == 1 means left-click from the mouse
  if button == 1 then 
    for _, btn in ipairs(buttons) do
      if x >= btn.x and x <= btn.x + btn.width and y >= btn.y and y <= btn.y + btn.height then
        btn.action()
      end
    end
  end
end

-- These two functions simply point to other functions that supply the logic
-- We can also safely assume here that the user intended to start a new game
-- so we can just barrel into the new game mess
function newGameClicked()
  love.graphics.clear()
  ng.createCharacterAndChooseDifficulty()
end

function loadGameClicked()
  love.window.showMessageBox("Sorry.", "Currently, there is no save/load system.", "error", false)
end