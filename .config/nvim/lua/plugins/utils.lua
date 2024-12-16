return {
  "snacks.nvim",
  opts = {
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    indent = { enabled = false },
    notifier = { enabled = false },
    dim = { enabled = true },
    zen = { enabled = true },
  },
  -- stylua: ignore
  keys = {
    { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    { "<leader>dps", function() Snacks.profiler.scratch() end, desc = "Profiler Scratch Buffer" },
    { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    { "<leader>d",  function() Snacks.dim() end, desc = "Toggle Dim Mode" },
  },
}
