-- rnum.nvim

local M = {}

local number_width = 4
local insert_mode_behavior = "absolute"  -- default

function M.setup(opts)
  opts = opts or {}
  number_width = opts.number_width or number_width
  insert_mode_behavior = opts.insert_mode or insert_mode_behavior

  vim.cmd("highlight! link CurrentLineNrCustom CursorLineNr")

  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.opt.statuscolumn = [[%!v:lua.require'rnum'.render()]]

  vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
      if insert_mode_behavior == "absolute" then
        vim.opt.number = true
        vim.opt.relativenumber = false
      elseif insert_mode_behavior == "relative" then
        vim.opt.number = true
        vim.opt.relativenumber = true
      elseif insert_mode_behavior == "none" then
        vim.opt.number = false
      end
    end,
  })

  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
      vim.opt.number = true
      vim.opt.relativenumber = true
    end,
  })
end

function M.render()
  local relnum = vim.v.relnum
  local lnum = vim.v.lnum
  local is_current = relnum == 0
  local num_text

  if vim.wo.relativenumber then
    num_text = is_current and lnum or relnum
  else
    num_text = lnum
  end

  local highlight = is_current and "%#CurrentLineNrCustom#" or "%#LineNr#"
  local padded = string.format("%" .. number_width .. "s", num_text)
  return highlight .. padded .. "%* "
end

return M