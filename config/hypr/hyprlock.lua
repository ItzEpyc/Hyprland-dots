-- Hyprland config (Lua)
-- Converted from hyprland.conf

------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

-------------------------
---- MY PROGRAMS --------
-------------------------

local terminal    = "kitty"
local fileManager = "nautilus"
local menu        = "rofi -show drun"
local wallpaper   = "swaybg -i /home/user/Images/default.png"
local powerm      = "sh /home/user/bin/powermenu"

---------------------
---- AUTOSTART ------
---------------------

hl.on("hyprland.start", function ()
    hl.exec_cmd("waybar &")
    hl.exec_cmd(wallpaper)
    hl.exec_cmd("dunst")
end)

-----------------------------------
---- ENVIRONMENT VARIABLES --------
-----------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

---------------------------
---- LOOK AND FEEL --------
---------------------------

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 7,

        border_size = 2,

        col = {
            active_border   = "rgba(ffffffff)",
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,
        allow_tearing    = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 5,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Curves
hl.curve("bounce",  { type = "bezier", points = { {0.0, 1.25}, {0.15, 1.0} } })
hl.curve("buttery", { type = "bezier", points = { {0.1, 1.15}, {0.15, 1.02} } })
hl.curve("smooth",  { type = "bezier", points = { {0.0, 0.0},  {0.12, 1.0} } })
hl.curve("linear",  { type = "bezier", points = { {0.0, 0.0},  {1.0, 1.0} } })

-- Animations
hl.animation({ leaf = "windowsIn",       enabled = true, speed = 4.5, bezier = "bounce",  style = "slide" })
hl.animation({ leaf = "windowsOut",      enabled = true, speed = 3.5, bezier = "smooth",  style = "slide" })
hl.animation({ leaf = "windowsMove",     enabled = true, speed = 4,   bezier = "buttery", style = "slide" })

hl.animation({ leaf = "fadeIn",          enabled = true, speed = 3.5, bezier = "smooth" })
hl.animation({ leaf = "fadeOut",         enabled = true, speed = 3,   bezier = "smooth" })
hl.animation({ leaf = "fadeDim",         enabled = true, speed = 4,   bezier = "smooth" })
hl.animation({ leaf = "fadeShadow",      enabled = true, speed = 4,   bezier = "smooth" })

hl.animation({ leaf = "workspaces",      enabled = true, speed = 4.5, bezier = "buttery", style = "slidefade 10%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 4.5, bezier = "buttery", style = "slidefadevert -15%" })

hl.animation({ leaf = "border",          enabled = true, speed = 7,  bezier = "smooth" })
hl.animation({ leaf = "borderangle",     enabled = true, speed = 35, bezier = "linear", style = "loop" })

hl.animation({ leaf = "layersIn",        enabled = true, speed = 4, bezier = "bounce", style = "slide" })
hl.animation({ leaf = "layersOut",       enabled = true, speed = 3, bezier = "smooth", style = "slide" })

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo   = false,
    },
})

-------------------
---- INPUT --------
-------------------

hl.config({
    input = {
        kb_layout  = "us,ru",
        kb_variant = "",
        kb_model   = "",
        kb_options = "grp:win_space_toggle",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity    = -0.8,
        force_no_accel = 1,

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C",      hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"))
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + I",      hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + V",      hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D",      hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + X",      hl.dsp.exec_cmd(powerm))
hl.bind(mainMod .. " + P",      hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J",      hl.dsp.layout("togglesplit"))

hl.bind("Print",       hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.exec_cmd('hyprpicker -a && notify-send "Color Picker" "Цвет скопирован" -i color-management'))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("grim ~/Images/Screens/$(date +'%Y-%m-%d_%H-%M-%S').png"))

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

for i = 1, 7 do
    hl.bind(mainMod .. " + " .. i,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),       { repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),      { repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),    { repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                   { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

----------------------------------
---- WINDOWS AND WORKSPACES ------
----------------------------------

hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
