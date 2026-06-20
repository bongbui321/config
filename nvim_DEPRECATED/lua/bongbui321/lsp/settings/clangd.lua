return {
  cmd = {
    "clangd",
    "--background-index",
    "--completion-style=detailed",
    "--header-insertion=never",
    "--limit-results=100",
  },
  init_options = {
    clangdFileStatus = false,
    completeUnimported = false,
    usePlaceholders = false,
  },
}
