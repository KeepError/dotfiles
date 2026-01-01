-- Define the Hyper Key (Cmd + Alt + Ctrl + Shift)
-- This assumes you mapped CapsLock to this combination via Karabiner
local hyper = { "cmd", "alt", "ctrl", "shift" }

hs.window.animationDuration = 0

--------------------------------------------------------------------------------
-- 1. WINDOW MANAGEMENT (Vim-style setup)
--------------------------------------------------------------------------------

-- Helper function to resize windows
function setFrame(x, y, w, h)
	local win = hs.window.focusedWindow()
	if not win then
		return
	end
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x + (max.w * x)
	f.y = max.y + (max.h * y)
	f.w = max.w * w
	f.h = max.h * h
	win:setFrame(f)
end

-- Left Half (Hyper + H)
hs.hotkey.bind(hyper, "H", function()
	setFrame(0, 0, 0.5, 1)
end)

-- Right Half (Hyper + L)
hs.hotkey.bind(hyper, "L", function()
	setFrame(0.5, 0, 0.5, 1)
end)

-- Top Half (Hyper + K)
hs.hotkey.bind(hyper, "K", function()
	setFrame(0, 0, 1, 0.5)
end)

-- Bottom Half (Hyper + J)
hs.hotkey.bind(hyper, "J", function()
	setFrame(0, 0.5, 1, 0.5)
end)

-- Maximize (Hyper + =)
hs.hotkey.bind(hyper, "=", function()
	hs.window.focusedWindow():maximize()
end)

-- Almost Maximize (Hyper + -)
-- Creates a centered window with some padding
hs.hotkey.bind(hyper, "-", function()
	local win = hs.window.focusedWindow()
	if not win then
		return
	end
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x + (max.w * 0.1)
	f.y = max.y + (max.h * 0.1)
	f.w = max.w * 0.8
	f.h = max.h * 0.8
	win:setFrame(f)
end)

-- Next Display (Hyper + Right Arrow)
hs.hotkey.bind(hyper, "right", function()
	local win = hs.window.focusedWindow()
	if win then
		win:moveOneScreenEast()
	end
end)

-- Previous Display (Hyper + Left Arrow)
hs.hotkey.bind(hyper, "left", function()
	local win = hs.window.focusedWindow()
	if win then
		win:moveOneScreenWest()
	end
end)

--------------------------------------------------------------------------------
-- 2. APPLICATION SWITCHING
--------------------------------------------------------------------------------

-- Ghostty (Hyper + 0)
hs.hotkey.bind(hyper, "0", function()
	hs.application.launchOrFocus("Ghostty")
end)

-- Visual Studio Code (Hyper + 7)
hs.hotkey.bind(hyper, "7", function()
	hs.application.launchOrFocus("Visual Studio Code")
end)

-- Google Chrome (Hyper + 8)
hs.hotkey.bind(hyper, "8", function()
	hs.application.launchOrFocus("Google Chrome")
end)

-- Zen Browser (Hyper + 9)
hs.hotkey.bind(hyper, "9", function()
	hs.application.launchOrFocus("Zen")
end)

hs.alert.show("Hammerspoon Config Loaded")
