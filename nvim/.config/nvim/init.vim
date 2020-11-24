" =============================================================================
" File:        init.vim
" Maintainer:  Alex Sun (ranmaru22)
" GitHub:      https://github.com/ranmaru22/dotfiles
" =============================================================================

" General settings
source $HOME/.config/nvim/config/general_settings.vim

" Plugins & related settings
source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/plugin_settings.vim
source $HOME/.config/nvim/config/colours.vim

" Syntax-related settings, LSPs, treesitter
source $HOME/.config/nvim/config/syntax_settings.vim

" Custom statusline
source $HOME/.config/nvim/config/statusline.vim

" Key mappings, commands & custom functions
source $HOME/.config/nvim/config/key_mappings.vim
source $HOME/.config/nvim/config/commands.vim

" vim:foldmethod=marker:foldlevel=0
