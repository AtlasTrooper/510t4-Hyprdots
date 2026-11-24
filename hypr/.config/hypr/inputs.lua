-- ~/.config/hypr/inputs.lua
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input

hl.config({
    input = {
        kb_layout  = "us,il",
        kb_options = "grp:rctrl_toggle",  -- Right Ctrl switches between us and il

        follow_mouse = 1,
        sensitivity  = 0,  -- -1.0 - 1.0, 0 means no modification

        touchpad = {
            natural_scroll = false,
        },
    },
})

-- Touchpad workspace swipe was disabled (workspace_swipe = false).
-- In Lua it is simply off unless you add an hl.gesture(...), e.g.:
-- hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Per-device config
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})
