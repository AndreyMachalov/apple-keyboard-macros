# Apple Keyboard Macros (Hammerspoon)

A collection of useful keyboard macros for Apple keyboards implemented with Hammerspoon.

This repository contains small automation scripts that extend the functionality of Apple keyboards on macOS.
Some Apple keys (like **Eject**) have little or no use on modern Macs. With Hammerspoon we can intercept these keys and turn them into powerful productivity shortcuts.

The goal of this repository is to provide a set of practical macros that can be easily customized.

Examples included in this repo:

* Smart behavior for the **Eject** key
* Custom long-press actions
* Keyboard-based automation for macOS

Each macro lives in its own directory with documentation and configuration instructions.

---

# Requirements

* macOS
* Hammerspoon

Hammerspoon is an automation tool that allows you to control macOS using Lua scripts.

Project website: https://www.hammerspoon.org

---

# Installing Hammerspoon

### Option 1 — Homebrew (recommended)

If you use Homebrew:

```bash
brew install --cask hammerspoon
```

### Option 2 — Manual installation

1. Download the app from
   https://www.hammerspoon.org
2. Move **Hammerspoon.app** to `/Applications`.

---

# Initial Setup

When you launch Hammerspoon for the first time it will request accessibility permissions.

Allow it in:

```
System Settings → Privacy & Security → Accessibility
```

Enable **Hammerspoon**.

---

# Configuration Directory

Hammerspoon loads its configuration from:

```
~/.hammerspoon/
```

If the directory does not exist:

```bash
mkdir ~/.hammerspoon
```

Then place your configuration files there.

Example:

```
~/.hammerspoon/init.lua
~/.hammerspoon/smart_eject.lua
```

---

# Loading Macros

Hammerspoon loads Lua modules from the `~/.hammerspoon` directory.

Each macro in this repository should be placed into that directory and loaded from `init.lua`.

Example repository file:

```
smart_eject.lua
```
Copy the macro file:
```
cp smart-eject/smart_eject.lua ~/.hammerspoon/
```

Then edit your main Hammerspoon configuration:

```
~/.hammerspoon/init.lua
```

Add:

```lua
require("smart_eject")
```

This tells Hammerspoon to load the macro module when it starts.

You can load multiple macros the same way. For example:

```lua
require("smart_eject")
require("another_macro")
require("capslock_remap")
```

Each module is loaded once when Hammerspoon starts or when the configuration is reloaded.

---

# Reloading Configuration

After editing configuration files you must reload Hammerspoon.

### From the menu

Click the Hammerspoon icon in the menu bar → **Reload Config**

### From terminal

```bash
killall Hammerspoon
open -a Hammerspoon
```

---

# Start Hammerspoon at Login

To run Hammerspoon automatically on system startup:

1. Open **Hammerspoon**
2. Click the menu bar icon
3. Enable:

```
Launch Hammerspoon at login
```

Alternatively:

```
System Settings → General → Login Items
```

Add **Hammerspoon.app**.

---

# Repository Structure

```
apple-keyboard-macros
│
├─ smart-eject
│  ├─ README.md
│  └─ smart_eject.lua
│
└─ README.md
```

Each directory contains:

* a macro implementation
* configuration instructions
* customization options

---

# Philosophy

The goal is to keep every macro:

* simple
* self-contained
* easy to modify
* safe to run on any Mac

---

# License

MIT
