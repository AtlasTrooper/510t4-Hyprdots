-- ~/.config/hypr/keyBindings.lua
-- See https://wiki.hypr.land/Configuring/Basics/Binds/

---------------------
---- MY PROGRAMS ----
---------------------
local terminal    = "kitty"
local fileManager = "thunar"
local menu        = "rofi -show drun"
local browser     = "firefox"
local noteApp     = "kate"
local musicPlayer = "spotatui"

local mainMod  = "ALT"    -- main modifier
local mainMod2 = "SUPER"  -- apps
local shift    = "SHIFT"

-- Laptop panel spec (same as in hyprland.lua), needed to re-enable it at runtime
local laptop = { output = "eDP-1", mode = "1920x1080@60", position = "2560x0", scale = 1 }

----------------------
---- APP KEYBINDS ----
----------------------
hl.bind(mainMod  .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod  .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod  .. " + space",  hl.dsp.exec_cmd(menu))
hl.bind(mainMod2 .. " + B",      hl.dsp.exec_cmd(browser))
hl.bind(mainMod2 .. " + N",      hl.dsp.exec_cmd(noteApp))
hl.bind(mainMod  .. " + L",      hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod2 .. " + M",      hl.dsp.exec_cmd(terminal .. " -e " .. musicPlayer))
hl.bind(mainMod  .. " + B",      hl.dsp.exec_cmd("flatpak run io.github.kaii_lb.Overskride"))

-- Region screenshot to clipboard
-- (the stray "output" argument from the old line was dropped; `-m region` is the mode)
hl.bind(mainMod2 .. " + " .. shift .. " + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))

-------------------------
---- UTILITY KEYBINDS ---
-------------------------
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t"))
hl.bind(mainMod .. " + C", hl.dsp.window.close())                         -- was killactive
hl.bind(mainMod .. " + M", hl.dsp.exit())                                 -- was exit
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))    -- was togglefloating
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())                        -- dwindle
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))                  -- dwindle
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("hyprctl switchkblayout current next"))

-- Laptop monitor enable / disable
hl.bind(mainMod .. " + " .. shift .. " + E", function()
    hl.monitor(laptop)
end)
hl.bind(mainMod .. " + " .. shift .. " + D", function()
    hl.monitor({ output = "eDP-1", disabled = true })
end)

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Move windows with mainMod + SHIFT + arrow keys
hl.bind(mainMod .. " + " .. shift .. " + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + " .. shift .. " + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + " .. shift .. " + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + " .. shift .. " + down",  hl.dsp.window.move({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
-- (a loop replaces the 20 repeated lines from the old config)
for i = 1, 10 do
    local key = i % 10  -- workspace 10 is on key 0
    hl.bind(mainMod .. " + " .. key,                    hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + " .. shift .. " + " .. key,  hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S",                   hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + " .. shift .. " + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging (was bindm)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

----------------------
---- MEDIA KEYS ------
----------------------
-- Volume and brightness (was bindel: repeating + works on lock screen)
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { repeating = true, locked = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { repeating = true, locked = true })

-- Player controls (was bindl; requires playerctl)
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
