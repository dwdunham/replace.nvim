" Title:        SwapWordKeepCase
" Description:  A plugin to provide a %s type of function that allows us to
"               swap words keeping case i.e. TestSuite RandomItem -> handles
"               TestSuite testSuite TESTSUITE testsuite TEST_SUITE test_suite
" Last Changes: 16 June 2024
" Maintainer:   https://github.com/dwdunham

" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:loaded_swapwordkeepcase")
    finish
endif
let g:loaded_swapwordkeepcase = 1

echo 'loading replace.vim'
" Defines a package path for Lua. This facilitates importing the
" Lua modules from the plugin's dependency directory.
let s:lua_rocks_deps_loc =  expand("<sfile>:h:r") . "/../lua/replace/deps"
exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/init.lua'"

" init.lua sets up the command(s)
lua require('replace_nvim')
