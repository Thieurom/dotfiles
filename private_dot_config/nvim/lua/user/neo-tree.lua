local status_ok, neo_tree = pcall(require, "neo-tree")
if not status_ok then
  return
end

neo_tree.setup {
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  filesystem = {
    follow_current_file = {
      enabled = true,
      leave_dirs_open = true,
    },
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = false,
    },
    window = {
      mappings = {
        ["<space>"] = "none",
        ["h"] = "close_node",
        ["l"] = "open",
      },
    },
  },
  window = {
    position = "left",
    width = 35,
    mappings = {
      ["q"] = "close_window",
    },
  },
}
