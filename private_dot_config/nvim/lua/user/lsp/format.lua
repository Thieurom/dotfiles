local M = {}

local function supports_format(client)
  return client:supports_method("textDocument/formatting")
end

function M.format()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr })
  local has_null_ls = false

  for _, client in ipairs(clients) do
    if client.name == "null-ls" and supports_format(client) then
      has_null_ls = true
      break
    end
  end

  vim.lsp.buf.format({
    bufnr = bufnr,
    async = false,
    filter = function(client)
      if has_null_ls then
        return client.name == "null-ls"
      end
      return supports_format(client)
    end,
  })
end

return M
