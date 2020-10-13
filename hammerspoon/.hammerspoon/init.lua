-- ============================================================================
-- File:        hammerspoon/init.lua
-- Maintainer:  Alex Sun (ranmaru22)
-- GitHub:      https://github.com/ranmaru22/dotfiles
-- ============================================================================

-- Load spoons {{{
hs.loadSpoon("ReloadConfiguration")
hs.loadSpoon("ControlEscape")
hs.loadSpoon("WindowHalfsAndThirds")
-- }}}

-- Auto-reload config
spoon.ReloadConfiguration:start()

-- Map Ctrl to Esc on single tap
spoon.ControlEscape:start()

-- Bind basic window tiling hotkeys
spoon.WindowHalfsAndThirds:bindHotkeys({
    max_toggle = { {"ctrl", "cmd"}, "return" },
    left_half = { {"ctrl", "cmd"}, "h" },
    bottom_half = { {"ctrl", "cmd"}, "j" },
    top_half = { {"ctrl", "cmd"}, "k" },
    right_half  = { {"ctrl", "cmd"}, "l" },
    undo = { {"ctrl", "cmd"}, "delete" },
    smaller = { {"ctrl", "cmd"}, "-" },
    larger = { {"ctrl", "cmd"}, "=" },

})

-- vim:foldmethod=marker:foldlevel=0
