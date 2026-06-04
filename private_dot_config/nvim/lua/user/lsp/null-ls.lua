local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
local helpers = require("null-ls.helpers")
local methods = require("null-ls.methods")

local ruff_fix_imports = helpers.make_builtin({
  name = "ruff_fix_imports",
  meta = {
    url = "https://docs.astral.sh/ruff/",
    description = "Sort Python imports with Ruff.",
  },
  method = methods.internal.FORMATTING,
  filetypes = { "python" },
  generator_opts = {
    command = "ruff",
    args = { "check", "--fix", "--select", "I", "$FILENAME" },
    to_temp_file = true,
    check_exit_code = { 0, 1 },
    ignore_stderr = true,
  },
  factory = helpers.formatter_factory,
})

local ruff_format = helpers.make_builtin({
  name = "ruff_format",
  meta = {
    url = "https://docs.astral.sh/ruff/formatter/",
    description = "Format Python with Ruff.",
  },
  method = methods.internal.FORMATTING,
  filetypes = { "python" },
  generator_opts = {
    command = "ruff",
    args = { "format", "--stdin-filename", "$FILENAME", "-" },
    to_stdin = true,
  },
  factory = helpers.formatter_factory,
})

null_ls.setup {
  debug = false,
  sources = {
    ruff_fix_imports,
    ruff_format,
    formatting.prettier,
    formatting.stylua,
    formatting.goimports,
  },
}
