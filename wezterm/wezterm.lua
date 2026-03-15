local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- theme (syncs with system)
local function scheme_for_appearance(appearance)
    if appearance:find 'Dark' then
        return 'GitHub Dark'
    end
    return 'Github (base16)'
end

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

wezterm.on('window-config-reloaded', function(window, _)
    local overrides = window:get_config_overrides() or {}
    overrides.color_scheme = scheme_for_appearance(window:get_appearance())
    window:set_config_overrides(overrides)
end)

-- fonts
config.font = wezterm.font_with_fallback({
    { family = 'SUSE Mono', weight = 'Regular' },
    { family = 'Zen Kaku Gothic New' },
})
config.font_size = 12.0
config.line_height = 1.1
config.cell_width = 1.1

-- cursor
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 800

-- window
config.initial_cols = 80
config.initial_rows = 24

config.window_background_opacity = 0.96
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE"

config.window_padding = {
    left = 28,
    right = 28,
    top = 28,
    bottom = 28,
}

-- tab bar
config.colors = config.colors or {}
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.colors.tab_bar = {
    active_tab = {
        bg_color = '#5973A6',
        fg_color = '#c0c0c0',
    }
}

return config
