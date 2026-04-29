# Smart Eject Key

This macro turns the **Eject** key on Apple keyboards into a smart power control key.

Modern Macs usually don't have an optical drive, so the Eject key becomes useless.
This script repurposes it into a convenient lock / sleep control.

---

# Features

The Eject key gains multi-stage behavior depending on how long it is held.

| Press duration          | Action              |
| ----------------------- | ------------------- |
| < 500 ms                | Do nothing          |
| > 500 ms                | Lock screen         |
| > 1500 ms               | Lock screen → Sleep |
| On lock screen > 500 ms | Sleep               |

This design prevents accidental activation when missing the **Backspace** key.

Typical usage:

```
short press → ignored
hold → lock screen
hold longer → sleep
```

If the screen is already locked:

```
hold → sleep
```

---

# Installation

1. Install Hammerspoon.
2. Create the configuration directory if needed:

```bash
mkdir -p ~/.hammerspoon
```

3. Copy the macro file:

```bash
cp smart_eject.lua ~/.hammerspoon/
```

4. Load it from your main config.

Edit:

```
~/.hammerspoon/init.lua
```

Add:

```lua
require("smart_eject")
```

---

# Customizing Timing

You can easily change timing thresholds.

Inside the script you will find:

```lua
LOCK_DELAY = 0.5
SLEEP_DELAY = 1.5
```

Meaning:

```
0.5 seconds → lock screen
1.5 seconds → sleep
```

Examples:

```
LOCK_DELAY = 0.3
SLEEP_DELAY = 1.2
```

Adjust these values to your preference.

---

# Updating the Configuration

After editing the file:

Reload Hammerspoon.

Menu bar:

```
Hammerspoon → Reload Config
```

Or restart the app.

---

# Restarting Hammerspoon from Terminal

```bash
killall Hammerspoon
open -a Hammerspoon
```

---

# Notes

The script uses the special **systemDefined** event type because macOS handles the Eject key differently from normal keyboard keys.

This allows Hammerspoon to intercept the key even when other tools cannot.

---

# Summary

This macro gives a second life to the Eject key:

```
Eject → Lock
Hold Eject → Sleep
```

Safe, simple, and very convenient for everyday use.
