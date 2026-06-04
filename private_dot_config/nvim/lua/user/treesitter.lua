local languages = {
  "lua",
  "javascript",
  "typescript",
  "tsx",
  "html",
  "html_tags",
  "css",
  "json",
  "ecma",
  "jsx",
  "markdown",
  "markdown_inline",
  "yaml",
  "bash",
  "python",
  "swift",
  "dart",
  "rust",
  "go",
  "gomod",
  "gosum",
}

local highlight_filetypes = {
  "lua",
  "javascript",
  "typescript",
  "typescriptreact",
  "html",
  "json",
  "markdown",
  "yaml",
  "sh",
  "bash",
  "python",
  "swift",
  "dart",
  "rust",
  "go",
  "gomod",
  "gosum",
}

local indent_filetypes = vim.tbl_filter(function(filetype)
  return not vim.tbl_contains({ "python" }, filetype)
end, highlight_filetypes)

local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
  return
end

treesitter.setup()
if vim.fn.executable("tree-sitter") == 1 then
  treesitter.install(languages)
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = highlight_filetypes,
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = indent_filetypes,
  callback = function()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
