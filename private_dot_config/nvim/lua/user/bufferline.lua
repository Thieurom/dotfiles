local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    separator_style = { " ", " " },
    buffer_close_icon = "x",
    close_icon = "x",
    show_buffer_close_icons = true,
    show_close_icon = true,
    indicator = {
      style = "none",
    },
  },
  highlights = {
    fill = { bg = "#1e1e2e" },
    background = { bg = "#11111b" },
    buffer_selected = { bg = "#11111b", bold = true, italic = true },
    separator = { fg = "#1e1e2e", bg = "#1e1e2e" },
    separator_selected = { fg = "#1e1e2e", bg = "#1e1e2e" },
    separator_visible = { fg = "#1e1e2e", bg = "#1e1e2e" },
  },
}
