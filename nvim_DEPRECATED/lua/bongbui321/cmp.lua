local cmp = require("cmp")

local max_buffer_completion_size = 256 * 1024

local function current_buffer_is_small()
  local path = vim.api.nvim_buf_get_name(0)
  if path == "" then
    return true
  end

  local size = vim.fn.getfsize(path)
  return size < 0 or size <= max_buffer_completion_size
end

cmp.setup {
  performance = {
    debounce = 80,
    throttle = 40,
    fetching_timeout = 200,
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp", keyword_length = 2 },
    { name = "path", keyword_length = 3 },
  }, {
    {
      name = "buffer",
      keyword_length = 3,
      option = {
        get_bufnrs = function()
          if not current_buffer_is_small() then
            return {}
          end

          return { vim.api.nvim_get_current_buf() }
        end,
      },
    },
  }),
  mapping = {
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end)
  },
}
