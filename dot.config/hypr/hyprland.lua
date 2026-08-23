-- gen by confToLua.py
-- Source: hyprland.conf
-- Some values might need MANUAL check. PLEASE DO BACKUP BEFORE TESTING, PLEASEEEE.


-- Variables
terminal = "kitty"
fileManager = "thunar"
menu = "rofi -show drun"
mainMod = "SUPER"

-- Env vars
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("NIXPKGS_ALLOW_UNFREE", "1")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("GDK_BACKEND", "wayland, x11")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("AQ_DRM_DEVICES", "/dev/dri/card0:/dev/dri/card1")
hl.env("GDK_SCALE", "1")
hl.env("QT_SCALE_FACTOR", "1")
hl.env("EDITOR", "nvim")

-- Monitors
hl.monitor({ output = "Virtual-1", mode = "1920x1080@60", position = "auto", scale = "1" })

hl.on("hyprland.start", function()
  hl.exec_cmd("waybar &")
  hl.exec_cmd("swww-daemon &")
  hl.exec_cmd("pypr &")
  hl.exec_cmd("dunst &")
  hl.exec_cmd("waypaper --restore &")
end)

-- General Config
hl.config({
  general = {
    gaps_in = 6,
    gaps_out = 20,
    border_size = 2,
    col = {
      active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
      inactive_border = "rgba(595959aa)",
    },
    resize_on_border = true,
    allow_tearing = false,
    layout = "dwindle",
  },
  decoration = {
    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },
    blur = {
      enabled = true,
      size = 3,
      passes = 1,
      vibrancy = 0.1696,
    },
    rounding = 10,
    active_opacity = 1.0,
    inactive_opacity = 0.75,
  },
  animations = {
    enabled = true,
    -- bezier = "quick,0.15,0,0.1,1",
    -- animation = "workspacesOut, 1, 1.94, almostLinear, fade",
  },
  dwindle = {
    preserve_split = true,
    force_split = 2,
  },
  master = {
    new_status = "master",
    new_on_top = 1,
    mfact = 0.5,
  },
  misc = {
    force_default_wallpaper = 0,
    layers_hog_keyboard_focus = true,
    initial_workspace_tracking = 0,
    mouse_move_enables_dpms = true,
    key_press_enables_dpms = false,
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    enable_swallow = false,
    vrr = 0,
    middle_click_paste = true,
    enable_anr_dialog = false,
  },
  input = {
    touchpad = {
      natural_scroll = false,
    },
    kb_layout = "us",
    kb_variant = "",
    kb_model = "",
    kb_options = "caps:super",
    kb_rules = "",
    follow_mouse = 1,
    sensitivity = 0,
  },
  gestures = {

  },
})

-- Keybindings
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + A", hl.dsp.exec_cmd("wezterm"))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + Q", hl.dsp.exit())
hl.bind("SUPER + T", hl.dsp.exec_cmd("thunar"))
hl.bind("SUPER + space", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + SHIFT + V", hl.dsp.exec_cmd("hyprctl dispatch workspaceopt allfloat"))
hl.bind("SUPER + D", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("SUPER + J", hl.dsp.layout("togglesplit"))
hl.bind("SUPER + P", hl.dsp.window.pseudo({ action = "toggle" }))
hl.bind("SUPER + SHIFT + Q", hl.dsp.exec_cmd("hyprctl activewindow | grep pid | tr -d 'pid:'| xargs kill"))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd("waypaper"))
hl.bind("SUPER + CTRL + W", hl.dsp.exec_cmd("waypaper"))
hl.bind("SUPER + Z", hl.dsp.exec_cmd("missioncenter"))
hl.bind("SUPER + left", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "d" }))
hl.bind("ALT + TAB", hl.dsp.window.cycle_next())
hl.bind("ALT + TAB", hl.dsp.window.bring_to_top())
hl.bind("SUPER + ALT + left", hl.dsp.window.swap({ direction = "l" }))
hl.bind("SUPER + ALT + right", hl.dsp.window.swap({ direction = "r" }))
hl.bind("SUPER + ALT + up", hl.dsp.window.swap({ direction = "u" }))
hl.bind("SUPER + ALT + down", hl.dsp.window.swap({ direction = "d" }))
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + CTRL + down", hl.dsp.focus({ workspace = "empty" }))
hl.bind("SUPER + P", hl.dsp.submap("passthru"))
hl.bind("SUPER + Escape", hl.dsp.submap("reset"))
hl.bind("SUPER + SHIFT + Return", hl.dsp.exec_cmd("pypr toggle term"))
hl.bind("SUPER + SHIFT + T", hl.dsp.exec_cmd("pypr toggle term"))
hl.bind("SUPER + code:49", hl.dsp.exec_cmd("pypr toggle term"))
hl.bind("SUPER + Tab", hl.dsp.focus({ workspace = "m+1" }))
hl.bind("SUPER + SHIFT + Tab", hl.dsp.focus({ workspace = "m-1" }))
hl.bind("SUPER + 1", hl.dsp.focus({ workspace = "1" }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = "2" }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = "3" }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = "4" }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = "5" }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = "6" }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = "7" }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = "8" }))
hl.bind("SUPER + 9", hl.dsp.focus({ workspace = "9" }))
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = "10" }))
hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = "1", follow = true }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = "2", follow = true }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = "3", follow = true }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = "4", follow = true }))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = "5", follow = true }))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = "6", follow = true }))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({ workspace = "7", follow = true }))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({ workspace = "8", follow = true }))
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({ workspace = "9", follow = true }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = "10", follow = true }))
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind("SUPER + SHIFT + right", hl.dsp.window.resize({ x = 100, y = 0 }))
hl.bind("SUPER + SHIFT + left", hl.dsp.window.resize({ x = -100, y = 0 }))
hl.bind("SUPER + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 100 }))
hl.bind("SUPER + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -100 }))
-- hl.bind("SUPER + G", hl.dsp.window.toggle_group())
hl.bind("SUPER + K", hl.dsp.layout("swapsplit"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
  { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { repeating = true, locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { repeating = true, locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { repeating = true, locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { repeating = true, locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Requires
-- require("lua.WindowRules")

-- raw lines, pending review
-- [failes migration]            submap = passthru
-- [failes migration]            submap = reset
