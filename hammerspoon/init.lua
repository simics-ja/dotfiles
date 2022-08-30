ctrlDoublePress = require("ctrlDoublePress")

ctrlDoublePress.action = function()
    local focusedScreen = hs.mouse.getCurrentScreen()
    local focusedSpace = hs.spaces.activeSpaceOnScreen(focusedScreen)
    local chromeFilter = hs.window.filter.new(false):setAppFilter("Google Chrome", true)
    local chromeWindow = chromeFilter:getWindows(hs.window.filter.sortByCreated)[1]

    if (hs.window.focusedWindow() == chromeWindow) then
        chromeWindow:sendToBack()
    else
        hs.spaces.moveWindowToSpace(chromeWindow, focusedSpace)
        chromeWindow:centerOnScreen(focusedScreen)
        chromeWindow:focus()
    end
end
