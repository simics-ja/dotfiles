-- Toggle showing app
toggleApp = function(appName)
    local focusedScreen = hs.mouse.getCurrentScreen()
    local focusedSpace = hs.spaces.activeSpaceOnScreen(focusedScreen)
    local filter = hs.window.filter.new(false):setAppFilter(appName)
    local app = hs.application.find(appName)
    local windows = filter:getWindows(hs.window.filter.sortByCreated)
    local window = windows[1]

    -- print(hs.inspect.inspect(windows))

    if (app:isHidden()) then
        app:unhide()
        window:focus()
    end

    if (not app:isHidden() and hs.window.focusedWindow() == window and window:screen() == focusedScreen) then
        app:hide()
    else
        hs.spaces.moveWindowToSpace(window, focusedSpace)
        window:centerOnScreen(focusedScreen)
        window:focus()
    end
end

-- Toggle Google Chrome in your focused screen (double tap ctrl)
ctrlDoublePress = require("ctrlDoublePress")
ctrlDoublePress.action = function()
    toggleApp("Google Chrome")
end

-- Toggle Finder in your focused screen (ctrl + f)
hs.hotkey.bind({"ctrl"}, "F", function()
    toggleApp("Finder")
end)

-- Paste text with line breaks removed
hs.hotkey.bind({"ctrl", "shift"}, "V", nil, function()
    local rawText = hs.pasteboard.readString()
    local lineBreakRemovedText = rawText:gsub("[\n\r]", " ")
    hs.pasteboard.writeObjects(hs.styledtext.new(lineBreakRemovedText))
    hs.eventtap.keyStroke({"cmd"}, "V")
end)