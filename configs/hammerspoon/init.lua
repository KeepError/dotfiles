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

-- Helper to launch app and move mouse to its center
function launchAndMove(appName)
	hs.application.launchOrFocus(appName)

	-- A small delay is often required to let the window focus actually register
	-- before we try to calculate coordinates.
	hs.timer.doAfter(0.1, function()
		local app = hs.application.get(appName)
		if app then
			local win = app:mainWindow() or app:focusedWindow()
			if win then
				local f = win:frame()
				local center = { x = f.x + (f.w / 2), y = f.y + (f.h / 2) }
				hs.mouse.absolutePosition(center)
			end
		end
	end)
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

-- Shrink Window (Hyper + -)
-- Shrinks width/height by 10% each press, keeping it centered
hs.hotkey.bind(hyper, "-", function()
	local win = hs.window.focusedWindow()
	if not win then
		return
	end

	local f = win:frame()
	local step = 0.9 -- 90% of current size (shrink by 10%)

	-- Store old dimensions to calculate center offset
	local oldW = f.w
	local oldH = f.h

	-- Apply shrink
	f.w = oldW * step
	f.h = oldH * step

	-- Adjust X and Y to keep the window centered while shrinking
	f.x = f.x + (oldW - f.w) / 2
	f.y = f.y + (oldH - f.h) / 2

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

-- Google Chrome (Hyper + 8)
hs.hotkey.bind(hyper, "8", function()
	launchAndMove("Google Chrome")
end)

-- Zen Browser (Hyper + 9)
hs.hotkey.bind(hyper, "9", function()
	launchAndMove("Zen")
end)

hs.alert.show("Hammerspoon Config Loaded")
