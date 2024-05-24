-- This file only handles the main menu and its functions
-- Anything else should be moved into its own file in the "game" dir

-- Global declarations here as well as initalizing of LOVE
function love.load()
  screenWidth = 800
  screenHeight = 600
  gameTitle = "Lua-Heroism - [dev]"

  -- Here we can start actually building the window
  -- This sets it to 800x600 and enables vsync for consisent feel across machines
  love.window.setMode(screenWidth, screenHeight)
  love.window.setVSync(1)

  -- Also just before loading, we push a little message noting that
  -- this is still a WIP and is not prod ready at all
  local devWarnMessage = love.window.showMessageBox("Quick notice!", "This is still a WIP project. This may or may not be playable or smooth.", "warning", false)
end

function love.update(dt)

end