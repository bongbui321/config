return {
  -- TODO: Let's try to make opacity work for inactive regions rather than full highlighting
  cmd = { 'clangd', '--clangd.inactiveRegions.useBackgroundHighlight=true"'}
}
