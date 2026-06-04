return {
  settings = {
    gopls = {
      staticcheck = true,
      analyses = {
        unusedparams = true,
        unusedwrite = true,
        nilness = true,
        useany = true,
      },
    },
  },
}
