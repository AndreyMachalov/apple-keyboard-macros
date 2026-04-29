-- Eject smart lock/sleep controller (with duplicate-down protection)

local holdStart = 0
local isDown = false

local LOCK_DELAY = 0.5
local SLEEP_DELAY = 1.5

local function screenLocked()
    local s = hs.caffeinate.sessionProperties()
    return s and s.CGSSessionScreenIsLocked
end

hs.eventtap.new({hs.eventtap.event.types.systemDefined}, function(event)

    local sys = event:systemKey()
    if sys.key ~= "EJECT" then return false end

    -- duplicate-DOWN protection
    if sys.down and isDown then
        return true
    end

    -- KEY DOWN
    if sys.down then
        isDown = true
        holdStart = hs.timer.secondsSinceEpoch()

        local lockedAtStart = screenLocked()

        hs.timer.doAfter(LOCK_DELAY, function()

            if not isDown then return end

            -- lock screen to sleep
            if lockedAtStart then
                hs.caffeinate.systemSleep()
                return
            end

            -- to lock screen
            hs.caffeinate.lockScreen()

            -- to sleep
            hs.timer.doAfter(SLEEP_DELAY - LOCK_DELAY, function()
                if isDown then
                    hs.caffeinate.systemSleep()
                end
            end)

        end)

        return false
    end

    -- KEY UP
    isDown = false
    return true

end):start()