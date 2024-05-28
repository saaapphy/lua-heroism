--[[
This soon to be large file will cover most, if not all save logic.

Loading, writing, validating and more will all happen here.
As of May 24, 2024 though; there is no system. It's not going to be
added for a few more days due to a busy personal life.

I advise that you don't try since we don't know what may 
go in here just yet.
]]--

-- The save file is going to be JSON, hence the requirement of the library
json = require "game.json"

local saveMgr = {}

function saveMgr.createSaveFile()
end

-- Yes I hope one day to make the content harder to modify
function saveMgr.validateSaveFile()
end

function saveMgr.loadSaveFileFromLocal()
end

function saveMgr.deleteCurrentSaveFile()
end

return saveMgr