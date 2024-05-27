local mainMenu = {}

local buttons = {}
local titleFont
local buttonFont

function mainMenu.init()
  -- Initalize font size and dimensions of the buttons
  titleFont = love.graphics.newFont("assets/fonts/OpenSansPX.ttf",60)
  buttonFont = love.graphics.newFont(24)

  local buttonWidth = 200
  local buttonHeight = 50
  local buttonX = (800 - buttonWidth) / 2
  local startY = 200
  local spacing = 20

  -- Declare the buttons we use and run a loop to insert them into buttons{} table
  local buttonNames = {"New Game", "Load Game", "Settings", "Quit", "Debug Start"}

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
        elseif name == "Load Game" then
          loadGameClicked()
        elseif name == "Settings" then
          love.window.showMessageBox("Sorry...", "This functionality has not yet been implemented.\nWe apologize for this inconvenience.", "error", false)
        elseif name == "Quit" then
          love.event.quit()

        -- this is a specially hardcoded start that just dives into the game
        -- no char create, no nothing, just right into the game
        elseif name == "Debug Start" then
          print("Debug start chosen.")
          -- todo: actually put in the start when the gameplay loop is created
        else
          print(name .. " button was pressed")
        end
      end
    })
  end
end

function mainMenu.draw()
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
function mainMenu.mousepressed(x, y, button, istouch, presses)
  -- button == 1 means left-click from the mouse
  if button == 1 then 
    for _, btn in ipairs(buttons) do
      if x >= btn.x and x <= btn.x + btn.width and y >= btn.y and y <= btn.y + btn.height then
        btn.action()
      end
    end
  end
end

return mainMenu