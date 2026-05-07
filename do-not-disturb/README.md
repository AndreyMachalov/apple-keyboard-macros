# Toggle Do Not Disturb with F6

This module adds a **Do Not Disturb (Focus)** toggle to the **F6 key** on Apple keyboards using Hammerspoon.

It works by calling a macOS **Shortcut** that toggles the system Focus mode.

This approach:

- works on any system language
- does not rely on UI automation
- does not use AppleScript
- works reliably across macOS updates

---

# Requirements

You need:

- macOS
- [Hammerspoon](https://www.hammerspoon.org)
- macOS **Shortcuts** app

---

# Installation

## 1. Install Hammerspoon

Download and install:

https://www.hammerspoon.org

Launch Hammerspoon once and allow the required permissions.

---

# Create the macOS Shortcut

You must create a Shortcut that toggles **Do Not Disturb**.

## 1. Open Shortcuts

Launch the **Shortcuts** app on macOS.

---

## 2. Create a new Shortcut

Click:

```
+
```

Rename the shortcut:

```
toggle-dnd
```

---

## 3. Add the action

Search for:

```
Set Focus
```

Add the action and configure it as:

```
Focus: Do Not Disturb
Turn: Toggle
```

The final shortcut should look like:

```
Set Do Not Disturb
Turn: Toggle
```

---

## 4. Test the Shortcut

Run the shortcut manually.

It should:

- enable Do Not Disturb
- disable Do Not Disturb when run again

---

# Install the Hammerspoon module

Create the directory if it does not exist:

```
~/.hammerspoon/modules
```

Create the file:

```
~/.hammerspoon/modules/do_not_disturb.lua
```

Paste the following code:

```lua
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
```

---

# Enable the module

Edit your Hammerspoon configuration file:

```
~/.hammerspoon/init.lua
```

Add:

```lua
require("modules.do_not_disturb").bind()
```

---

# Reload Hammerspoon

Reload the configuration:

```
Hammerspoon menu → Reload Config
```

or run:

```lua
hs.reload()
```

---

# Usage

Press:

```
F6
```

The system will toggle **Do Not Disturb**.

---

# How it works

The module executes the macOS command:

```
shortcuts run toggle-dnd
```

This runs the Shortcut created earlier, which toggles the **Do Not Disturb** Focus mode.

This method avoids UI scripting and works independently of the system language.