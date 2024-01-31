local colorscheme = "lunaperche"

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
  return
end

-- Sets colors to line numbers Above, Current and Below  in this order
function CustomUiSettings()
  vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#FB508F", bold = true })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "white", bold = true })
  vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#51B3EC", bold = true })
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

CustomUiSettings()
