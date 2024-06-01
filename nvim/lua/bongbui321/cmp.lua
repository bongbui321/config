local cmp = require("cmp")

cmp.setup {
  sources = {
    { name = "nvim_lsp", keyword_length = 1},
    { name = "buffer", keyword_length = 1},
    { name = "path", keyword_length = 1},
  },
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
