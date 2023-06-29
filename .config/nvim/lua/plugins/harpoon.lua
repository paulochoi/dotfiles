return {
  "ThePrimeagen/harpoon",
  keys = {
    { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", "Harpoon add file" },
    { "<C-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon toggle menu" },
    {
      "<C-z>",
      '<cmd>lua require("harpoon.ui").nav_file(1)<cr>',
      "Harpoon toggle menu",
    },
    {
      "<C-x>",
      '<cmd>lua require("harpoon.ui").nav_file(2)<cr>',
      "Harpoon toggle menu",
    },
    {
      "<C-c>",
      '<cmd>lua require("harpoon.ui").nav_file(3)<cr>',
      "Harpoon toggle menu",
    },
    {
      "<C-v>",
      '<cmd>lua require("harpoon.ui").nav_file(4)<cr>',
      "Harpoon toggle menu",
    },
  },
}
