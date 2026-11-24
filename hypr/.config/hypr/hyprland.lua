-- ~/.config/hypr/hyprland.lua
-- Migrated from hyprland.conf (hyprlang) for Hyprland 0.55+
-- Reference: https://wiki.hypr.land/
--
-- NOTE: hyprlock.conf, hypridle.conf and hyprpaper.conf are NOT sourced here
-- anymore. Those tools still use hyprlang and read their own files from
-- ~/.config/hypr/ by themselves, so they stay untouched.
--
-- NOTE: every required file runs in its own isolated scope, so `local`
-- variables are not shared between files.

------------------
---- MONITORS ----
------------------
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

-- HDMI on the left, laptop panel on the right
hl.monitor({ output = "HDMI-A-1", mode = "2560x1440",    position = "0x0",    scale = 1 })
hl.monitor({ output = "eDP-1",    mode = "1920x1080@60", position = "2560x0", scale = 1 })

-- Old 4K setup, kept for reference:
-- hl.monitor({ output = "HDMI-A-1", mode = "3840x2160", position = "0x0", scale = 1 })
-- hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = 1 })

-- Any other monitor you plug in gets placed to the right automatically
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

-----------------
---- AUTOSTART --
-----------------
-- Replaces exec-once. Runs once per Hyprland start (not on config reload).
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
    hl.exec_cmd("hyprpaper")
    -- hl.exec_cmd("hypridle")   -- uncomment to enable idle locking/suspend (see hypridle.conf)
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("udiskie")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("GDK_SCALE", "1")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "0")
hl.env("QT_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")  -- falls back to xcb if a Qt app has no wayland plugin
hl.env("WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")

---------------
---- CURSOR ---
---------------
hl.config({
    cursor = {
        no_hardware_cursors = true,
    },
})

-- `debug { suppress_errors = true }` was removed on purpose: it only existed to hide
-- the errors caused by sourcing hyprlock/hypridle/hyprpaper configs into Hyprland.
-- Use `hyprctl configerrors` to see real problems.

-----------------------
---- OTHER CONFIGS ----
-----------------------
-- Replaces `source = ...`
require("keyBindings")
require("windWork")
require("inputs")
require("looknFeel")
