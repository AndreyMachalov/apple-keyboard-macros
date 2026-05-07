local M = {}

function M.toggleDnd()
    hs.task.new(
        "/usr/bin/shortcuts",
        nil,
        { "run", "toggle-dnd" }
    ):start()
end

function M.bind()
    hs.hotkey.bind({}, "F6", function()
        M.toggleDnd()
    end)
end

return M