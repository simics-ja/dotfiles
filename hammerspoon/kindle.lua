-- Kindle auto screenshot and page turn automation for AI reading
-- Drop this file into ~/.hammerspoon/init.lua or require it from there.

local config = {
    appName = "Kindle", -- Change if your Kindle app name differs
    screenshotDir = os.getenv("HOME") .. "/Pictures/KindleShots",
    filePrefix = "kindle_page_",
    intervalSeconds = 1,
    maxPages = 200, -- set to a number to stop automatically after that many pages
    pageAdvanceKey = "left",
    pageAdvanceMods = {},
    preCaptureDelay = 0.3,
    postCaptureDelay = 0.2,
    startHotkey = { mods = { "ctrl", "alt", "cmd" }, key = "k" },
    stopHotkey = { mods = { "ctrl", "alt", "cmd" }, key = "." },
    pauseHotkey = { mods = { "ctrl", "alt", "cmd" }, key = "p" },
    notifications = true,
}

local state = {
    timer = nil,
    pagesCaptured = 0,
    paused = false,
}

local function sendNotification(title, text)
    if not config.notifications then
        return
    end
    hs.notify.new({
        title = title,
        informativeText = text,
        withdrawAfter = 5,
    }):send()
end

local function ensureScreenshotDir()
    local attrs, err = hs.fs.attributes(config.screenshotDir)
    if attrs then
        return true
    end
    local ok, mkdirErr = hs.fs.mkdir(config.screenshotDir)
    if ok then
        return true
    end
    hs.printf("[KindleCapture] Failed to create screenshot directory: %s", mkdirErr or err or "unknown error")
    sendNotification("Kindle Capture", "スクリーンショット保存先を作成できませんでした")
    return false
end

local function locateKindleApp()
    local app = hs.application.get(config.appName)
    if app then
        return app
    end
    -- Try bundle identifier fallback if provided
    if config.bundleID then
        local bundleApp = hs.application.applicationsForBundleID(config.bundleID)
        if bundleApp and bundleApp[1] and bundleApp[1].path then
            return hs.application.open(bundleApp[1].path)
        end
    end
    return nil
end

local function ensureKindleActive()
    local app = locateKindleApp()
    if not app then
        sendNotification("Kindle Capture", "Kindleが起動していません。起動してから再実行してください。")
        hs.printf("[KindleCapture] Kindle app not running")
        return nil, nil
    end
    app:activate(true)
    hs.timer.usleep(200000) -- brief wait for focus
    local win = app:mainWindow() or app:focusedWindow() or app:allWindows()[1]
    if not win then
        sendNotification("Kindle Capture", "Kindleウィンドウが見つかりません。表示状態を確認してください。")
        hs.printf("[KindleCapture] Kindle window not found")
        return nil, nil
    end
    return app, win
end

local function buildFilename()
    local timestamp = os.date("%Y%m%d-%H%M%S")
    local counter = string.format("%03d", state.pagesCaptured + 1)
    return string.format("%s/%s%s-%s.png", config.screenshotDir, config.filePrefix, timestamp, counter)
end

local function captureAndAdvance()
    if state.paused then
        return
    end

    local app, win = ensureKindleActive()
    if not win then
        return
    end

    if config.preCaptureDelay and config.preCaptureDelay > 0 then
        hs.timer.usleep(config.preCaptureDelay * 1000000)
    end

    local image = win:snapshot()
    if not image then
        hs.printf("[KindleCapture] Failed to snapshot Kindle window")
        sendNotification("Kindle Capture", "ウィンドウのキャプチャに失敗しました")
        return
    end

    if not ensureScreenshotDir() then
        return
    end

    local filename = buildFilename()
    local success, saveErr = image:saveToFile(filename)
    if not success then
        hs.printf("[KindleCapture] Failed to save screenshot: %s", saveErr or "unknown error")
        sendNotification("Kindle Capture", "スクリーンショット保存に失敗しました")
        return
    end

    state.pagesCaptured = state.pagesCaptured + 1
    hs.printf("[KindleCapture] Saved %s", filename)

    if config.maxPages and state.pagesCaptured >= config.maxPages then
        sendNotification("Kindle Capture", string.format("%dページ分の撮影が完了しました", state.pagesCaptured))
        if state.timer then
            state.timer:stop()
            state.timer = nil
        end
        return
    end

    if config.postCaptureDelay and config.postCaptureDelay > 0 then
        hs.timer.usleep(config.postCaptureDelay * 1000000)
    end

    hs.eventtap.keyStroke(config.pageAdvanceMods, config.pageAdvanceKey)
end

local function stopCapture(reason)
    if state.timer then
        state.timer:stop()
        state.timer = nil
    end
    local captured = state.pagesCaptured
    state.pagesCaptured = 0
    state.paused = false
    if reason then
        sendNotification("Kindle Capture", reason)
    elseif captured > 0 then
        sendNotification("Kindle Capture", string.format("終了しました（%dページ）", captured))
    end
end

local function startCapture()
    if state.timer then
        sendNotification("Kindle Capture", "既に実行中です")
        return
    end
    state.pagesCaptured = 0
    state.paused = false

    local _, win = ensureKindleActive()
    if not win then
        return
    end

    if not ensureScreenshotDir() then
        return
    end

    captureAndAdvance()

    state.timer = hs.timer.doEvery(config.intervalSeconds, captureAndAdvance)
    sendNotification("Kindle Capture", "自動スクリーンショットを開始しました")
end

local function togglePause()
    if not state.timer then
        sendNotification("Kindle Capture", "実行中ではありません")
        return
    end
    state.paused = not state.paused
    if state.paused then
        sendNotification("Kindle Capture", "一時停止しました")
    else
        sendNotification("Kindle Capture", "再開しました")
    end
end

local function stopViaHotkey()
    if not state.timer then
        sendNotification("Kindle Capture", "既に停止しています")
        return
    end
    stopCapture()
end

hs.hotkey.bind(config.startHotkey.mods, config.startHotkey.key, startCapture)
hs.hotkey.bind(config.stopHotkey.mods, config.stopHotkey.key, stopViaHotkey)
hs.hotkey.bind(config.pauseHotkey.mods, config.pauseHotkey.key, togglePause)

hs.printf("[KindleCapture] Kindle automation script loaded")

return {
    start = startCapture,
    stop = stopCapture,
    pause = togglePause,
    config = config,
    state = state,
}
