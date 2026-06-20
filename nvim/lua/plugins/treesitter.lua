-- local languages = {
--   'lua',
--   'json',
--   'python',
--   'bash',
--   'markdown',
--   'markdown_inline',
--   'c',
--   'cpp',
-- }
--
-- local filetypes = {
--   'lua',
--   'json',
--   'python',
--   'sh',
--   'bash',
--   'markdown',
--   'c',
--   'cpp',
-- }
--
-- local function install_parsers()
--   if vim.fn.executable('tree-sitter') == 0 then
--     return nil
--   end
--
--   return require('nvim-treesitter').install(languages)
-- end
--
-- return {
--   'nvim-treesitter/nvim-treesitter',
--   lazy = false,
--   build = function()
--     local task = install_parsers()
--     if task then
--       task:wait(300000)
--     end
--   end,
--   config = function()
--     local treesitter = require('nvim-treesitter')
--     local runtime = vim.fn.stdpath('data') .. '/lazy/nvim-treesitter/runtime'
--
--     if not vim.tbl_contains(vim.opt.runtimepath:get(), runtime) then
--       vim.opt.runtimepath:append(runtime)
--     end
--
--     treesitter.setup()
--     install_parsers()
--
--     vim.api.nvim_create_autocmd('FileType', {
--       pattern = filetypes,
--       callback = function(args)
--         local filetype = vim.bo[args.buf].filetype
--         local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
--         if vim.list_contains(languages, lang) then
--           local ok = pcall(vim.treesitter.start, args.buf, lang)
--           if not ok then
--             vim.bo[args.buf].syntax = filetype
--           end
--         end
--       end,
--     })
--   end,
--
--

return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'master',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require("nvim-treesitter.configs").setup {
      -- A list of parser names, or "all" (the listed parsers MUST always be installed)
      ensure_installed = { "c", "cpp", "lua", "markdown", "markdown_inline", "python" },
      auto_install = false,

      highlight = {
        enable = true,
        -- disable = { "c", "rust" },
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        -- disable = function(lang, buf)
        --     local max_filesize = 100 * 1024 -- 100 KB
        --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        --     if ok and stats and stats.size > max_filesize then
        --         return true
        --     end
        -- end,
      },
    }
  end
}
