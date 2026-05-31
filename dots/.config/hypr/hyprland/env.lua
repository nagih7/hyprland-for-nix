-- env.lua — migrated from env.conf (Hyprland 0.55 Lua config)

-- Wayland
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- Themes
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "kde")
hl.env("XDG_MENU_PREFIX", "plasma-")

-- Virtual environment
hl.env("ILLOGICAL_IMPULSE_VIRTUAL_ENV", "~/.local/state/quickshell/.venv")
