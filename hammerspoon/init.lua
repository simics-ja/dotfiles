-- Toggle showing app
toggleApp = function(appName)
    local focusedScreen = hs.mouse.getCurrentScreen()
    local focusedSpace = hs.spaces.activeSpaceOnScreen(focusedScreen)
    local filter = hs.window.filter.new(false):setAppFilter(appName)
    local windows = filter:getWindows()
    local window = windows[1]
    print(hs.inspect.inspect(windows))

    if (hs.window.focusedWindow() == window) then
        window:sendToBack()
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