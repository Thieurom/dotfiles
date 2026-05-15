local options = {
    number = true,
    cursorline = true,
    ignorecase = true,
    smartcase = true,
    expandtab = true,
    smarttab = true,
    shiftwidth = 4,
    tabstop = 4,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

