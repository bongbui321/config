return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" }
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup {
      sources = cmp.config.sources({
        { name = "nvim_lsp", keyword_length = 2 },
        { name = "path", keyword_length = 3 },
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
  end
}
