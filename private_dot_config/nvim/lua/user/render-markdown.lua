local status_ok, render_markdown = pcall(require, "render-markdown")
if not status_ok then
  return
end

render_markdown.setup {
  completions = {
    lsp = {
      enabled = true,
    },
  },
  file_types = { "markdown" },
}
