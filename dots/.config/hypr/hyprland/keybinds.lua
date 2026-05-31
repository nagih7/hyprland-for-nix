-- keybinds.lua — migrated from keybinds.conf (Hyprland 0.55 Lua config)
-- Injected verbatim into hyprland.lua via home-manager extraConfig.
--
-- All binds live inside the "global" submap (end-4 pattern) so the shell can
-- toggle them as a group. The submap is entered at startup via hyprland.start.
--
-- Cheatsheet: parsed by scripts/hyprland/get_keybinds.py (Lua-aware version).
--   * section headings are comment lines starting with  --!   or  --##!
--   * a bind is shown on the cheatsheet when it has a `desc = "..."`
--   * a `-- [hidden]` trailing comment hides a bind from the cheatsheet

local qsConfig     = "ii"

-- App launchers (mirrors programs.nix / variables.conf)
local terminal      = "wezterm"
local fileManager   = "dolphin"
local browser       = "zen"
local codeEditor    = "code"
local officeSoftware = [[~/.config/hypr/hyprland/scripts/launch_first_available.sh "wps" "onlyoffice-desktopeditors" "libreoffice"]]
local textEditor    = [[~/.config/hypr/hyprland/scripts/launch_first_available.sh "kate" "gnome-text-editor" "emacs"]]
local volumeMixer   = [[~/.config/hypr/hyprland/scripts/launch_first_available.sh "pavucontrol-qt" "pavucontrol"]]
local settingsApp   = [[XDG_CURRENT_DESKTOP=gnome ~/.config/hypr/hyprland/scripts/launch_first_available.sh "qs -p ~/.config/quickshell/]] .. qsConfig .. [[/settings.qml" "systemsettings" "gnome-control-center" "better-control"]]
local taskManager   = [[~/.config/hypr/hyprland/scripts/launch_first_available.sh "gnome-system-monitor" "plasma-systemmonitor --page-name Processes" "command -v btop && kitty -1 fish -c btop"]]

-- helper: run a quickshell ipc/script command with $qsConfig interpolated
local function qsc(rest) return "qs -c " .. qsConfig .. " " .. rest end

hl.define_submap("global", function()

  --! Shell
  -- Launcher (fallback) — these need to be on top
  hl.bind("SUPER + Super_L", hl.dsp.exec_cmd(qsc("ipc call TEST_ALIVE || pkill fuzzel || fuzzel"))) -- [hidden]
  hl.bind("SUPER + Super_R", hl.dsp.exec_cmd(qsc("ipc call TEST_ALIVE || pkill fuzzel || fuzzel"))) -- [hidden]
  hl.bind("CTRL + Super_L", hl.dsp.global("quickshell:searchToggleReleaseInterrupt")) -- [hidden]
  hl.bind("CTRL + Super_R", hl.dsp.global("quickshell:searchToggleReleaseInterrupt")) -- [hidden]
  hl.bind("SUPER + mouse:272", hl.dsp.global("quickshell:searchToggleReleaseInterrupt")) -- [hidden]
  hl.bind("SUPER + mouse:273", hl.dsp.global("quickshell:searchToggleReleaseInterrupt")) -- [hidden]
  hl.bind("SUPER + mouse:274", hl.dsp.global("quickshell:searchToggleReleaseInterrupt")) -- [hidden]
  hl.bind("SUPER + mouse:275", hl.dsp.global("quickshell:searchToggleReleaseInterrupt")) -- [hidden]
  hl.bind("SUPER + mouse:276", hl.dsp.global("quickshell:searchToggleReleaseInterrupt")) -- [hidden]
  hl.bind("SUPER + mouse:277", hl.dsp.global("quickshell:searchToggleReleaseInterrupt")) -- [hidden]
  hl.bind("SUPER + mouse_up", hl.dsp.global("quickshell:searchToggleReleaseInterrupt")) -- [hidden]
  hl.bind("SUPER + mouse_down", hl.dsp.global("quickshell:searchToggleReleaseInterrupt")) -- [hidden]

  -- bindit equivalent: separate press + release binds so GlobalStates.superDown resets correctly
  hl.bind("Super_L", hl.dsp.global("quickshell:workspaceNumber"), { ignore_mods = true, transparent = true }) -- [hidden]
  hl.bind("Super_R", hl.dsp.global("quickshell:workspaceNumber"), { ignore_mods = true, transparent = true }) -- [hidden]
  hl.bind("Super_L", hl.dsp.global("quickshell:workspaceNumber"), { ignore_mods = true, transparent = true, release = true }) -- [hidden]
  hl.bind("Super_R", hl.dsp.global("quickshell:workspaceNumber"), { ignore_mods = true, transparent = true, release = true }) -- [hidden]
  hl.bind("SUPER + Tab", hl.dsp.global("quickshell:overviewWorkspacesToggle"), { desc = "Toggle overview" })
  hl.bind("SUPER + V", hl.dsp.global("quickshell:overviewClipboardToggle"), { desc = "Clipboard history >> clipboard" })
  hl.bind("SUPER + Period", hl.dsp.global("quickshell:overviewEmojiToggle"), { desc = "Emoji >> clipboard" })
  hl.bind("SUPER + A", hl.dsp.global("quickshell:sidebarLeftToggle"), { desc = "Toggle left sidebar" })
  hl.bind("SUPER + ALT + A", hl.dsp.global("quickshell:sidebarLeftToggleDetach")) -- [hidden]
  hl.bind("SUPER + N", hl.dsp.global("quickshell:sidebarRightToggle"), { desc = "Toggle right sidebar" })
  hl.bind("SUPER + Slash", hl.dsp.global("quickshell:cheatsheetToggle"), { desc = "Toggle cheatsheet" })
  hl.bind("SUPER + K", hl.dsp.global("quickshell:oskToggle"), { desc = "Toggle on-screen keyboard" })
  hl.bind("SUPER + CTRL + M", hl.dsp.global("quickshell:mediaControlsToggle"), { desc = "Toggle media controls" })
  hl.bind("SUPER + G", hl.dsp.global("quickshell:overlayToggle"), { desc = "Toggle overlay" })
  hl.bind("CTRL + ALT + Delete", hl.dsp.global("quickshell:sessionToggle"), { desc = "Toggle session menu" })
  hl.bind("SUPER + J", hl.dsp.global("quickshell:barToggle"), { desc = "Toggle bar" })
  hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd(qsc("ipc call TEST_ALIVE || pkill wlogout || wlogout -p layer-shell"))) -- [hidden]
  hl.bind("SHIFT + SUPER + ALT + Slash", hl.dsp.exec_cmd("qs -p ~/.config/quickshell/" .. qsConfig .. "/welcome.qml")) -- [hidden]

  hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(qsc("ipc call brightness increment || brightnessctl s 5%+")), { locked = true, repeating = true }) -- [hidden]
  hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(qsc("ipc call brightness decrement || brightnessctl s 5%-")), { locked = true, repeating = true }) -- [hidden]
  hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+ -l 1.5"), { locked = true, repeating = true }) -- [hidden]
  hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"), { locked = true, repeating = true }) -- [hidden]

  hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SINK@ toggle"), { locked = true }) -- [hidden]
  hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SINK@ toggle"), { locked = true, desc = "Toggle mute" })
  hl.bind("ALT + XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"), { locked = true }) -- [hidden]
  hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"), { locked = true }) -- [hidden]
  hl.bind("SUPER + M", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"), { locked = true, desc = "Toggle mic" })
  hl.bind("CTRL + SUPER + T", hl.dsp.global("quickshell:wallpaperSelectorToggle"), { desc = "Toggle wallpaper selector" })
  hl.bind("CTRL + SUPER + ALT + T", hl.dsp.global("quickshell:wallpaperSelectorRandom"), { desc = "Select random wallpaper" })
  hl.bind("CTRL + SUPER + T", hl.dsp.exec_cmd(qsc("ipc call TEST_ALIVE || ~/.config/quickshell/" .. qsConfig .. "/scripts/colors/switchwall.sh"))) -- [hidden]
  hl.bind("CTRL + SUPER + R", hl.dsp.exec_cmd("killall ydotool qs quickshell; qs -c " .. qsConfig .. " &"), { desc = "Restart widgets" })
  hl.bind("CTRL + SUPER + P", hl.dsp.global("quickshell:panelFamilyCycle"), { desc = "Cycle panel family" })

  --! Utilities
  hl.bind("SUPER + V", hl.dsp.exec_cmd(qsc([[ipc call TEST_ALIVE || pkill fuzzel || cliphist list | fuzzel --match-mode fzf --dmenu | cliphist decode | wl-copy]]))) -- [hidden]
  hl.bind("SUPER + Period", hl.dsp.exec_cmd(qsc("ipc call TEST_ALIVE || pkill fuzzel || ~/.config/hypr/hyprland/scripts/fuzzel-emoji.sh copy"))) -- [hidden]
  hl.bind("SUPER + SHIFT + S", hl.dsp.global("quickshell:regionScreenshot"), { desc = "Screen snip" })
  hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd(qsc("ipc call TEST_ALIVE || pidof slurp || hyprshot --freeze --clipboard-only --mode region --silent"))) -- [hidden]
  hl.bind("SUPER + SHIFT + A", hl.dsp.global("quickshell:regionSearch"), { desc = "Google Lens" })
  hl.bind("SUPER + SHIFT + A", hl.dsp.exec_cmd(qsc("ipc call TEST_ALIVE || pidof slurp || ~/.config/hypr/hyprland/scripts/snip_to_search.sh"))) -- [hidden]
  hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"), { desc = "Pick color (Hex) >> clipboard" })
  hl.bind("SUPER + SHIFT + R", hl.dsp.global("quickshell:regionRecord"), { locked = true, desc = "Record region (no sound)" })
  hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd(qsc("ipc call TEST_ALIVE || ~/.config/quickshell/" .. qsConfig .. "/scripts/videos/record.sh")), { locked = true }) -- [hidden]
  hl.bind("SUPER + ALT + R", hl.dsp.global("quickshell:regionRecord"), { locked = true }) -- [hidden]
  hl.bind("SUPER + ALT + R", hl.dsp.exec_cmd(qsc("ipc call TEST_ALIVE || ~/.config/quickshell/" .. qsConfig .. "/scripts/videos/record.sh")), { locked = true }) -- [hidden]
  hl.bind("CTRL + ALT + R", hl.dsp.exec_cmd("~/.config/quickshell/" .. qsConfig .. "/scripts/videos/record.sh --fullscreen"), { locked = true }) -- [hidden]
  hl.bind("SUPER + SHIFT + ALT + R", hl.dsp.exec_cmd("~/.config/quickshell/" .. qsConfig .. "/scripts/videos/record.sh --fullscreen --sound"), { locked = true, desc = "Record screen (with sound)" })
  hl.bind("Print", hl.dsp.exec_cmd([[grim -o "$(hyprctl activeworkspace -j | jq -r '.monitor')" - | wl-copy]]), { locked = true, desc = "Screenshot >> clipboard" })
  hl.bind("SUPER + CTRL + Backspace", hl.dsp.exec_cmd([[mkdir -p /home/$(whoami)/Pictures/Screenshots && grim -o "$(hyprctl activeworkspace -j | jq -r '.monitor')" /home/$(whoami)/Pictures/Screenshots/Screenshot_"$(date '+%Y-%m-%d_%H.%M.%S')".png]]), { locked = true, non_consuming = true, desc = "Screenshot >> clipboard & file" })
  hl.bind("SUPER + CTRL + Backspace", hl.dsp.exec_cmd([[grim -o "$(hyprctl activeworkspace -j | jq -r '.monitor')" - | wl-copy]]), { locked = true, non_consuming = true }) -- [hidden]
  hl.bind("SUPER + SHIFT + ALT + mouse:273", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/ai/primary-buffer-query.sh"), { desc = "Generate AI summary for selected text" }) -- [hidden]

  --! Window
  hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { desc = "Move" })
  hl.bind("SUPER + mouse:274", hl.dsp.window.drag()) -- [hidden]
  hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { desc = "Resize" })
  hl.bind("SUPER + CTRL + h", hl.dsp.focus({ direction = "left" })) -- [hidden]
  hl.bind("SUPER + CTRL + l", hl.dsp.focus({ direction = "right" })) -- [hidden]
  hl.bind("SUPER + CTRL + k", hl.dsp.focus({ direction = "up" })) -- [hidden]
  hl.bind("SUPER + CTRL + j", hl.dsp.focus({ direction = "down" })) -- [hidden]
  hl.bind("SUPER + BracketLeft", hl.dsp.focus({ direction = "left" })) -- [hidden]
  hl.bind("SUPER + BracketRight", hl.dsp.focus({ direction = "right" })) -- [hidden]
  hl.bind("SUPER + SHIFT + Left", hl.dsp.window.move({ direction = "left" })) -- [hidden]
  hl.bind("SUPER + SHIFT + Right", hl.dsp.window.move({ direction = "right" })) -- [hidden]
  hl.bind("SUPER + SHIFT + Up", hl.dsp.window.move({ direction = "up" })) -- [hidden]
  hl.bind("SUPER + SHIFT + Down", hl.dsp.window.move({ direction = "down" })) -- [hidden]
  hl.bind("ALT + F4", hl.dsp.window.close()) -- [hidden] Close (Windows)
  hl.bind("SUPER + Q", hl.dsp.window.close(), { desc = "Close" })
  hl.bind("SUPER + SHIFT + ALT + Q", hl.dsp.exec_cmd("hyprctl kill"), { desc = "Forcefully zap a window" })

  hl.bind("SUPER + Semicolon", hl.dsp.layout("splitratio -0.1"), { repeating = true }) -- [hidden]
  hl.bind("SUPER + Apostrophe", hl.dsp.layout("splitratio +0.1"), { repeating = true }) -- [hidden]
  hl.bind("SUPER + ALT + Space", hl.dsp.window.float({ action = "toggle" }), { desc = "Float/Tile" })
  hl.bind("SUPER + D", hl.dsp.window.fullscreen({ mode = 1 }), { desc = "Maximize" })
  hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = 0 }), { desc = "Fullscreen" })
  hl.bind("SUPER + ALT + F", hl.dsp.window.fullscreen_state({ internal = 0, client = 3 }), { desc = "Fullscreen spoof" })
  hl.bind("SUPER + P", hl.dsp.window.pin(), { desc = "Pin" })

  -- Move to workspace (raw keycodes; verify with `wev`)
  hl.bind("SUPER + SHIFT + code:10", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspace 1")) -- [hidden]
  hl.bind("SUPER + SHIFT + code:11", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspace 2")) -- [hidden]
  hl.bind("SUPER + SHIFT + code:12", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspace 3")) -- [hidden]
  hl.bind("SUPER + SHIFT + code:13", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspace 4")) -- [hidden]
  hl.bind("SUPER + SHIFT + code:14", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspace 5")) -- [hidden]
  hl.bind("SUPER + SHIFT + code:15", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspace 6")) -- [hidden]
  hl.bind("SUPER + SHIFT + code:16", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspace 7")) -- [hidden]
  hl.bind("SUPER + SHIFT + code:17", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspace 8")) -- [hidden]
  hl.bind("SUPER + SHIFT + code:18", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspace 9")) -- [hidden]
  hl.bind("SUPER + SHIFT + code:19", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspace 10")) -- [hidden]
  hl.bind("SUPER + SHIFT + code:87", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspace 1")) -- [hidden]
  hl.bind("SUPER + SHIFT + code:88", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspace 2")) -- [hidden]
  hl.bind("SUPER + SHIFT + code:89", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspace 3")) -- [hidden]
  hl.bind("SUPER + SHIFT + code:83", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspace 4")) -- [hidden]
  hl.bind("SUPER + SHIFT + code:84", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspace 5")) -- [hidden]
  hl.bind("SUPER + SHIFT + code:85", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspace 6")) -- [hidden]
  hl.bind("SUPER + SHIFT + code:79", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspace 7")) -- [hidden]
  hl.bind("SUPER + SHIFT + code:80", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspace 8")) -- [hidden]
  hl.bind("SUPER + SHIFT + code:81", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspace 9")) -- [hidden]
  hl.bind("SUPER + SHIFT + code:90", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspace 10")) -- [hidden]

  hl.bind("SUPER + SHIFT + mouse_down", hl.dsp.window.move({ workspace = "r-1" })) -- [hidden]
  hl.bind("SUPER + SHIFT + mouse_up", hl.dsp.window.move({ workspace = "r+1" })) -- [hidden]
  hl.bind("SUPER + ALT + mouse_down", hl.dsp.window.move({ workspace = "-1" })) -- [hidden]
  hl.bind("SUPER + ALT + mouse_up", hl.dsp.window.move({ workspace = "+1" })) -- [hidden]
  hl.bind("SUPER + ALT + Page_Down", hl.dsp.window.move({ workspace = "+1" })) -- [hidden]
  hl.bind("SUPER + ALT + Page_Up", hl.dsp.window.move({ workspace = "-1" })) -- [hidden]
  hl.bind("SUPER + SHIFT + Page_Down", hl.dsp.window.move({ workspace = "r+1" })) -- [hidden]
  hl.bind("SUPER + SHIFT + Page_Up", hl.dsp.window.move({ workspace = "r-1" })) -- [hidden]
  hl.bind("CTRL + SUPER + SHIFT + Right", hl.dsp.window.move({ workspace = "r+1" })) -- [hidden]
  hl.bind("CTRL + SUPER + SHIFT + Left", hl.dsp.window.move({ workspace = "r-1" })) -- [hidden]
  hl.bind("SUPER + ALT + S", hl.dsp.window.move({ workspace = "special" }), { desc = "Send to scratchpad" })
  hl.bind("CTRL + SUPER + S", hl.dsp.workspace.toggle_special()) -- [hidden]

  --! Workspace
  hl.bind("SUPER + code:10", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 1")) -- [hidden]
  hl.bind("SUPER + code:11", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 2")) -- [hidden]
  hl.bind("SUPER + code:12", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 3")) -- [hidden]
  hl.bind("SUPER + code:13", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 4")) -- [hidden]
  hl.bind("SUPER + code:14", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 5")) -- [hidden]
  hl.bind("SUPER + code:15", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 6")) -- [hidden]
  hl.bind("SUPER + code:16", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 7")) -- [hidden]
  hl.bind("SUPER + code:17", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 8")) -- [hidden]
  hl.bind("SUPER + code:18", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 9")) -- [hidden]
  hl.bind("SUPER + code:19", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 10")) -- [hidden]
  hl.bind("SUPER + code:87", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 1"), { dont_inhibit = true }) -- [hidden]
  hl.bind("SUPER + code:88", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 2"), { dont_inhibit = true }) -- [hidden]
  hl.bind("SUPER + code:89", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 3"), { dont_inhibit = true }) -- [hidden]
  hl.bind("SUPER + code:83", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 4"), { dont_inhibit = true }) -- [hidden]
  hl.bind("SUPER + code:84", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 5"), { dont_inhibit = true }) -- [hidden]
  hl.bind("SUPER + code:85", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 6"), { dont_inhibit = true }) -- [hidden]
  hl.bind("SUPER + code:79", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 7"), { dont_inhibit = true }) -- [hidden]
  hl.bind("SUPER + code:80", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 8"), { dont_inhibit = true }) -- [hidden]
  hl.bind("SUPER + code:81", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 9"), { dont_inhibit = true }) -- [hidden]
  hl.bind("SUPER + code:90", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 10"), { dont_inhibit = true }) -- [hidden]

  hl.bind("CTRL + SUPER + l", hl.dsp.focus({ workspace = "r+1" })) -- [hidden]
  hl.bind("CTRL + SUPER + h", hl.dsp.focus({ workspace = "r-1" })) -- [hidden]
  hl.bind("CTRL + SUPER + ALT + Right", hl.dsp.focus({ workspace = "m+1" })) -- [hidden]
  hl.bind("CTRL + SUPER + ALT + Left", hl.dsp.focus({ workspace = "m-1" })) -- [hidden]
  hl.bind("SUPER + Page_Down", hl.dsp.focus({ workspace = "+1" })) -- [hidden]
  hl.bind("SUPER + Page_Up", hl.dsp.focus({ workspace = "-1" })) -- [hidden]
  hl.bind("CTRL + SUPER + Page_Down", hl.dsp.focus({ workspace = "r+1" })) -- [hidden]
  hl.bind("CTRL + SUPER + Page_Up", hl.dsp.focus({ workspace = "r-1" })) -- [hidden]
  hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "+1" })) -- [hidden]
  hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "-1" })) -- [hidden]
  hl.bind("CTRL + SUPER + mouse_up", hl.dsp.focus({ workspace = "r+1" })) -- [hidden]
  hl.bind("CTRL + SUPER + mouse_down", hl.dsp.focus({ workspace = "r-1" })) -- [hidden]
  hl.bind("SUPER + S", hl.dsp.workspace.toggle_special(), { desc = "Toggle scratchpad" })
  hl.bind("SUPER + mouse:275", hl.dsp.workspace.toggle_special()) -- [hidden]
  hl.bind("CTRL + SUPER + BracketLeft", hl.dsp.focus({ workspace = "-1" })) -- [hidden]
  hl.bind("CTRL + SUPER + BracketRight", hl.dsp.focus({ workspace = "+1" })) -- [hidden]
  hl.bind("CTRL + SUPER + Up", hl.dsp.focus({ workspace = "r-5" })) -- [hidden]
  hl.bind("CTRL + SUPER + Down", hl.dsp.focus({ workspace = "r+5" })) -- [hidden]

  --! Testing
  hl.bind("SUPER + ALT + Equal", hl.dsp.exec_cmd([[notify-send "Urgent notification" "Ah hell no" -u critical -a 'Hyprland keybind']])) -- [hidden]

  --! Session
  hl.bind("SUPER + SHIFT + L", hl.dsp.exec_cmd("loginctl lock-session"), { desc = "Lock" })
  hl.bind("SUPER + SHIFT + Backspace", hl.dsp.exec_cmd("systemctl suspend || loginctl suspend"), { locked = true, desc = "Suspend system" })
  hl.bind("CTRL + SHIFT + ALT + SUPER + Delete", hl.dsp.exec_cmd("systemctl poweroff || loginctl poweroff"), { desc = "Shutdown" }) -- [hidden]

  --! Screen
  hl.bind("SUPER + Minus", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/zoom.sh decrease 0.3"), { repeating = true, desc = "Zoom out" })
  hl.bind("SUPER + Equal", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/zoom.sh increase 0.3"), { repeating = true, desc = "Zoom in" })
  hl.bind("SUPER + code:82", hl.dsp.exec_cmd(qsc("ipc call zoom zoomOut")), { repeating = true }) -- [hidden]
  hl.bind("SUPER + code:86", hl.dsp.exec_cmd(qsc("ipc call zoom zoomIn")), { repeating = true }) -- [hidden]
  hl.bind("SUPER + code:82", hl.dsp.exec_cmd(qsc("ipc call TEST_ALIVE || ~/.config/hypr/hyprland/scripts/zoom.sh decrease 0.1")), { repeating = true }) -- [hidden]
  hl.bind("SUPER + code:86", hl.dsp.exec_cmd(qsc("ipc call TEST_ALIVE || ~/.config/hypr/hyprland/scripts/zoom.sh increase 0.1")), { repeating = true }) -- [hidden]

  --! Media
  hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd([[playerctl next || playerctl position `bc <<< "100 * $(playerctl metadata mpris:length) / 1000000 / 100"`]]), { locked = true, desc = "Next track" })
  hl.bind("XF86AudioNext", hl.dsp.exec_cmd([[playerctl next || playerctl position `bc <<< "100 * $(playerctl metadata mpris:length) / 1000000 / 100"`]]), { locked = true }) -- [hidden]
  hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true }) -- [hidden]
  hl.bind("SUPER + SHIFT + ALT + mouse:275", hl.dsp.exec_cmd("playerctl previous")) -- [hidden]
  hl.bind("SUPER + SHIFT + ALT + mouse:276", hl.dsp.exec_cmd([[playerctl next || playerctl position `bc <<< "100 * $(playerctl metadata mpris:length) / 1000000 / 100"`]])) -- [hidden]
  hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("playerctl previous"), { locked = true, desc = "Previous track" })
  hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, desc = "Play/pause media" })
  hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true }) -- [hidden]
  hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true }) -- [hidden]

  --! Apps
  hl.bind("SUPER + Space", hl.dsp.exec_cmd(terminal), { desc = "Terminal" })
  hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager), { desc = "File manager" })
  hl.bind("SUPER + B", hl.dsp.exec_cmd(browser), { desc = "Browser" })
  hl.bind("SUPER + C", hl.dsp.exec_cmd(codeEditor), { desc = "Code editor" })
  hl.bind("SUPER + D", hl.dsp.exec_cmd("discord"))
  hl.bind("CTRL + SUPER + SHIFT + ALT + W", hl.dsp.exec_cmd(officeSoftware), { desc = "Office software" })
  hl.bind("SUPER + X", hl.dsp.exec_cmd(textEditor), { desc = "Text editor" })
  hl.bind("CTRL + SUPER + V", hl.dsp.exec_cmd(volumeMixer), { desc = "Volume mixer" })
  hl.bind("SUPER + I", hl.dsp.exec_cmd(settingsApp), { desc = "Settings app" })
  hl.bind("CTRL + SHIFT + Escape", hl.dsp.exec_cmd(taskManager), { desc = "Task manager" })

  -- Cursed stuff: make window not amogus large
  hl.bind("CTRL + SUPER + Backslash", hl.dsp.window.resize({ exact = true, x = 640, y = 480 })) -- [hidden]

end)

-- Enter the global submap at startup (replaces `exec = hyprctl dispatch submap global`)
hl.on("hyprland.start", function()
  hl.dispatch(hl.dsp.submap("global"))
end)
