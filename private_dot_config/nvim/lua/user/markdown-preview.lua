-- markdown-preview.nvim: live preview in the system browser
vim.g.mkdp_auto_start = 0 -- don't open preview on entering a markdown buffer
vim.g.mkdp_auto_close = 1 -- close preview tab when leaving the buffer
vim.g.mkdp_theme = "dark"
vim.g.mkdp_browser = "" -- empty = system default browser

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function(event)
    vim.keymap.set(
      "n",
      "<leader>mp",
      "<cmd>MarkdownPreviewToggle<cr>",
      { buffer = event.buf, silent = true, desc = "Markdown preview (toggle)" }
    )
  end,
})
