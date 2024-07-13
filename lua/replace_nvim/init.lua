-- TODO This needs to be removed once properly done.
-- print('package.path:', package.path)
local util = require('replace.util')
local swap = require('replace.swap')

---@class VimInput
---@field line1 number
---@field line2 number
---@field args string

---Shim functionality for vim
---@param opts VimInput
local function swap_words(opts)
  ---@type number
  local start = opts.line1;
  ---@type number
  local endl = opts.line2;
  ---@type string[]
  local input = util.split_on_first_char(opts.args)
  -- This will be marked as deprecated but in nvim we're using 5.1... ??? Stupid
  ---@type string, string, string
  local orig, repl, options = unpack(input)
  local buf = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(buf, start -1, endl, false)
  local q = {}
  for _, line in ipairs(lines) do
    local changed = swap.swap_words(line, orig, repl, options)
    table.insert(q, changed)
  end
  vim.api.nvim_buf_set_lines(buf, start - 1, endl, false, q)
end

local names = { 'SwapWordKeepCase', 'R' }
for i = 1, #names, 1 do
  local name = names[i]
  vim.api.nvim_create_user_command(
    name,
    swap_words,
    -- https://neovim.io/doc/user/map.html#%3Acommand-bar
    -- https://neovim.io/doc/user/map.html#%3Acommand-buffer
    { nargs='?', range=true, addr='lines', }
  )
end

-- vim: set fdm=marker fmr=--#region,--#endregion sts=2 sw=2:
