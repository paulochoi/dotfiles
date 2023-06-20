require('leap').add_default_mappings()
require("leap").setup({
	special_keys = {
		repeat_search = "<space>",
		next_phase_one_target = "<space>",
		next_target = { "<space>", ";" },
		prev_target = { "<tab>", "," },
		next_group = "<space>",
		prev_group = "<tab>",
		multi_accept = "<space>",
		multi_revert = "<backspace>",
	},
})
