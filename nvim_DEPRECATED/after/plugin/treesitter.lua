local max_tree_sitter_file_size = 256 * 1024

local function is_large_file(bufnr)
  local path = vim.api.nvim_buf_get_name(bufnr)
  if path == "" then
    return false
  end

  local ok, stats = pcall(vim.loop.fs_stat, path)
  return ok and stats and stats.size > max_tree_sitter_file_size
end

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {"c", "cpp", "vim", "javascript", "typescript", "python", "verilog", "bash", "asm", "markdown"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,
    disable = function(lang, bufnr)
      return (lang == "c" or lang == "cpp") and is_large_file(bufnr)
    end,
    additional_vim_regex_highlighting = false,
  },
}
