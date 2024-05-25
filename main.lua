-- This file only handles the main menu and its functions
-- Anything else should be moved into its own file in the "game" dir

local mainMenu = require("game.mainMenu")
local newGame = require("game.newGame")

-- Definition of states
local state = {
  MAIN_MENU = mainMenu,
  NEW_GAME = newGame,
}

-- This game should always start in the main menu
-- Anywhere else leads to undefined or bad behaviour
local currentState = state.MAIN_MENU

function love.load()
  -- Here we can start actually building the window
  -- This sets it to 800x600 and enables vsync for consisent feel across machines
  love.window.setVSync(1)
 
  -- Also just before loading, we push a little message noting that
  -- this is still a WIP and is not prod ready at all
  local devWarnMessage = love.window.showMessageBox("Quick notice!", "This is still a WIP project. This may or may not be playable or smooth.\nBugs or crashes should be reported on our GitHub!", "warning", false)
  local devShowGitHub = love.window.showMessageBox("GitHub Repository", "https://github.com/saaapphy/lua-heroism/", "info", false)

  -- Not best practice, but basically every window state should be init here
  -- Probably a bad idea and a heavy load, but it works...
  currentState.init()
  newGame.init()
end

function love.draw()
  currentState.draw()  
end

-- Handle when buttons get clicked and change state
function love.mousepressed(x, y, button, istouch, presses)
  currentState.mousepressed(x, y, button, istouch, presses)
end

function changeState(newState)
  currentState = state[newState]
end

-- These two are special, main menu specific functions
-- that are absolutely vital to everything working
-- This is hardcoded only because it doesn't error out
function newGameClicked()
  love.graphics.clear()
  currentState = state.NEW_GAME
end

function loadGameClicked()
  love.window.showMessageBox("Sorry...", "This functionality has not yet been implemented.\nWe apologize for this inconvenience.", "error", false)
end