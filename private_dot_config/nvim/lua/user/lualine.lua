local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local branch = {
  "branch",
  cond = hide_in_width,
}

local diagnostics = {
  function()
    local counts = {
      [vim.diagnostic.severity.ERROR] = 0,
      [vim.diagnostic.severity.WARN] = 0,
    }

    for _, diagnostic in ipairs(vim.diagnostic.get(0)) do
      if counts[diagnostic.severity] ~= nil then
        counts[diagnostic.severity] = counts[diagnostic.severity] + 1
      end
    end

    return string.format(
      "E:%d W:%d",
      counts[vim.diagnostic.severity.ERROR],
      counts[vim.diagnostic.severity.WARN]
    )
  end,
}

local diff = {
  "diff",
  colored = false,
  symbols = { added = "+", modified = "~", removed = "-" },
  cond = hide_in_width,
}

local filetype = {
  "filetype",
  icons_enabled = false,
}

local location = {
  function()
    return string.format("%d:%d", vim.fn.line("."), vim.fn.col(".") - 1)
  end,
  color = { fg = "#89b4fa", bg = "#313244", gui = "bold" },
  padding = { left = 1, right = 1 },
}

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = " ", right = " " },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { branch },
    lualine_c = { diagnostics },
    lualine_x = { diff, spaces, "encoding", filetype },
    lualine_y = { location },
    lualine_z = {
      {
        "progress",
        color = { fg = "#11111b", bg = "#89b4fa", gui = "bold" },
      },
    },
  },
}
