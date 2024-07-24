local options = {
  auto_install = true,
  incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        -- node_incremental = "gl",
        -- scope_incremental = "gns",
        -- node_decremental = "gnd",
      },
    },
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

return options
