-- To get this DAP configuration to work for javascript/typescript
-- Inspiration from: https://github.com/anasrar/.dotfiles/blob/2023/neovim/.config/nvim/lua/rin/DAP/main.lua
-- 1 - Install 'js-debug-adapter' from mason
-- 2 - Install the following plugins
-- use("mfussenegger/nvim-dap")
-- use({ "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } })
-- use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
-- use("theHamsta/nvim-dap-virtual-text")
-- use({
-- 	"microsoft/vscode-js-debug",
-- })
-- 3 - Run the manual steps denoted here: https://github.com/mxsdev/nvim-dap-vscode-js
-- 4 - Copy the out folder out the mason path for js-debug-adapter
-- 5 - For kitty, install the following font: https://github.com/microsoft/vscode-codicons/blob/main/dist/codicon.ttf

-- # DAP
local M = {}

M.plugin = {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-treesitter/nvim-treesitter",
		"theHamsta/nvim-dap-virtual-text",
		"mxsdev/nvim-dap-vscode-js",
	},
	event = "VeryLazy",
	config = function()
		M.setup()
	end,
}

M.setup = function()
	local dap = require("dap")
	local dapui = require("dapui")
	local dap_ext_vscode = require("dap.ext.vscode")
	local dap_virtual_text = require("nvim-dap-virtual-text")

	-- # Sign
	vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
	vim.fn.sign_define("DapBreakpointCondition", { text = "🟧", texthl = "", linehl = "", numhl = "" })
	vim.fn.sign_define("DapLogPoint", { text = "🟩", texthl = "", linehl = "", numhl = "" })
	vim.fn.sign_define("DapStopped", { text = "🈁", texthl = "", linehl = "", numhl = "" })
	vim.fn.sign_define("DapBreakpointRejected", { text = "⬜", texthl = "", linehl = "", numhl = "" })

	-- # DAP Virtual Text
	dap_virtual_text.setup({
		enabled = true,
		enabled_commands = true,
		highlight_changed_variables = true,
		highlight_new_as_changed = false,
		show_stop_reason = true,
		commented = false,
		only_first_definition = true,
		all_references = false,
		filter_references_pattern = "<module",
		virt_text_pos = "eol",
		all_frames = false,
		virt_lines = false,
		virt_text_win_col = nil,
	})

	-- # DAP UI
	dapui.setup({
		icons = { expanded = "▾", collapsed = "▸" },
		mappings = {
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "o",
			remove = "d",
			edit = "e",
			repl = "r",
			toggle = "t",
		},
		expand_lines = true,
		layouts = {
			{
				elements = {
					-- Elements can be strings or table with id and size keys.
					{ id = "scopes", size = 0.25 },
					"breakpoints",
					"stacks",
					"watches",
				},
				size = 40,
				position = "right",
			},
			{
				elements = {
					{ id = "repl", size = 0.5 },
					{ id = "console", size = 0.5 },
				},
				size = 10,
				position = "bottom",
			},
		},
		floating = {
			max_height = nil, -- These can be integers or a float between 0 and 1.
			max_width = nil, -- Floats will be treated as percentage of your screen.
			border = "rounded", -- Border style. Can be "single", "double" or "rounded"
			mappings = {
				close = { "q", "<Esc>" },
			},
		},
		windows = { indent = 1 },
		render = {
			max_type_length = nil,
		},
	})
	dap.listeners.after.event_initialized["dapui_config"] = function()
		vim.cmd("tabfirst|tabnext")
		dapui.open()
	end
	-- dap.listeners.before.event_terminated["dapui_config"] = function()
	--   dapui.close()
	-- end
	-- dap.listeners.before.event_exited["dapui_config"] = function()
	--   dapui.close()
	-- end

	local keymap = vim.keymap.set
	keymap("n", "<Leader>db", dap.toggle_breakpoint)
	keymap("n", "<Leader>dB", ':lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
	keymap("n", "<Leader>dp", ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
	keymap("n", "<Leader>ds", ':lua require("dap").continue()<CR>')
	keymap("n", "<Leader>dl", ':lua require("dap").run_to_cursor()<CR>')
	keymap("n", "<Leader>dS", ':lua require("dap").disconnect()<CR>')
	keymap("n", "<Leader>dn", ':lua require("dap").step_over()<CR>')
	keymap("n", "<Leader>dN", ':lua require("dap").step_into()<CR>')
	keymap("n", "<Leader>do", ':lua require("dap").step_out()<CR>')

	keymap("n", "<Leader>du", ':lua require("dapui").toggle()<CR>')
	keymap("n", "<Leader>du[", ':lua require("dapui").toggle(1)<CR>')
	keymap("n", "<Leader>du]", ':lua require("dapui").toggle(2)<CR>')

	-- # DAP Config
	local dap_utils = require("dap.utils")
	local dap_vscode_js = require("dap-vscode-js")

	dap_vscode_js.setup({
		node_path = "node",
		debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
		adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
	})

	local exts = {
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		-- using pwa-chrome
		"vue",
		"svelte",
	}

	for i, ext in ipairs(exts) do
		dap.configurations[ext] = {
			-- {
			-- 	type = "pwa-node",
			-- 	request = "launch",
			-- 	name = "Launch Current File (pwa-node)",
			-- 	cwd = vim.fn.getcwd(),
			-- 	args = { "${file}" },
			-- 	sourceMaps = true,
			-- 	protocol = "inspector",
			-- },
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch Current File (pwa-node with ts-node)",
				cwd = vim.fn.getcwd(),
				runtimeArgs = { "--loader", "ts-node/esm" },
				runtimeExecutable = "node",
				args = { "${file}" },
				sourceMaps = true,
				protocol = "inspector",
				skipFiles = { "<node_internals>/**", "node_modules/**" },
				resolveSourceMapLocations = {
					"${workspaceFolder}/**",
					"!**/node_modules/**",
				},
			},
			{
				env = {
					HI_MODE = "LOCAL",
					NODE_OPTIONS = "--max-old-space-size=8192",
					NODE_ENV = "development",
					GRAPH_PORT = "8102",
					HI_SERVICE_DB_URL = "postgres://service:service@localhost:5440/service",
					LOCAL_STACK_USE = "true",
					HI_ENV_MODE = "dev",
					EVENT_OUTBOX_PUBLISH_DELAY_SECONDS = "0",
					TZ = "UTC",
				},
				type = "pwa-node",
				request = "launch",
				name = "SOA Tests in Jest - Current File",
				cwd = vim.fn.getcwd(),
				runtimeArgs = { "jest" },
				runtimeExecutable = "npx",
				args = { "${file}", "--coverage", "false" },
				rootPath = "${workspaceFolder}",
				sourceMaps = true,
				console = "integratedTerminal",
				internalConsoleOptions = "neverOpen",
				skipFiles = { "<node_internals>/**", "node_modules/**" },
			},
			{
				env = {
					HI_MODE = "LOCAL",
					NODE_OPTIONS = "--max-old-space-size=8192",
					NODE_ENV = "development",
					GRAPH_PORT = "8102",
					HI_SERVICE_DB_URL = "postgres://service:service@localhost:5440/service",
					LOCAL_STACK_USE = "true",
					HI_ENV_MODE = "dev",
					EVENT_OUTBOX_PUBLISH_DELAY_SECONDS = "0",
					TZ = "UTC",
				},
				type = "pwa-node",
				request = "launch",
				name = "SOA Tests in Jest - Pattern",
				cwd = vim.fn.getcwd(),
				runtimeArgs = { "jest" },
				runtimeExecutable = "npx",
				args = function()
					local argument_string = vim.fn.input("Program arguments: ")
					local pattern = { "-t", argument_string, "--coverage", "false" }
          return pattern
				end,
				rootPath = "${workspaceFolder}",
				sourceMaps = true,
				console = "integratedTerminal",
				internalConsoleOptions = "neverOpen",
				skipFiles = { "<node_internals>/**", "node_modules/**" },
			},
			-- {
			-- 	type = "pwa-node",
			-- 	request = "launch",
			-- 	name = "Launch Test Current File (pwa-node with jest)",
			-- 	cwd = vim.fn.getcwd(),
			-- 	runtimeArgs = { "${workspaceFolder}/node_modules/.bin/jest" },
			-- 	runtimeExecutable = "node",
			-- 	args = { "${file}", "--coverage", "false" },
			-- 	rootPath = "${workspaceFolder}",
			-- 	sourceMaps = true,
			-- 	console = "integratedTerminal",
			-- 	internalConsoleOptions = "neverOpen",
			-- 	skipFiles = { "<node_internals>/**", "node_modules/**" },
			-- },
			{
				type = "pwa-node",
				request = "launch",
				name = "Debug Mocha Tests",
				cwd = vim.fn.getcwd(),
				-- trace = true, -- include debugger info
				runtimeExecutable = "node",
				runtimeArgs = {
					"./node_modules/mocha/bin/mocha.js",
				},
				rootPath = "${workspaceFolder}",
				sourceMaps = true,
				cwd = "${workspaceFolder}",
				console = "integratedTerminal",
				internalConsoleOptions = "neverOpen",
				skipFiles = { "<node_internals>/**", "node_modules/**" },
			},
			-- {
			-- 	type = "pwa-node",
			-- 	request = "launch",
			-- 	name = "Launch Test Current File (pwa-node with vitest)",
			-- 	cwd = vim.fn.getcwd(),
			-- 	program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
			-- 	args = { "--inspect-brk", "--threads", "false", "run", "${file}" },
			-- 	autoAttachChildProcesses = true,
			-- 	smartStep = true,
			-- 	console = "integratedTerminal",
			-- 	skipFiles = { "<node_internals>/**", "node_modules/**" },
			-- },
			{
				type = "pwa-chrome",
				request = "attach",
				name = "Attach Program (pwa-chrome, select port)",
				program = "${file}",
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				port = function()
					return vim.fn.input("Select port: ", 9222)
				end,
				webRoot = "${workspaceFolder}",
			},
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach Program (pwa-node, select pid)",
				cwd = vim.fn.getcwd(),
				processId = dap_utils.pick_process,
				skipFiles = { "<node_internals>/**" },
			},
		}
	end

	-- ## DAP `launch.json`
	dap_ext_vscode.load_launchjs(nil, {
		-- ["python"] = {
		-- 	"python",
		-- },
		["pwa-node"] = {
			"javascript",
			"typescript",
		},
		["node"] = {
			"javascript",
			"typescript",
		},
		-- ["cppdbg"] = {
		-- 	"c",
		-- 	"cpp",
		-- },
		-- ["dlv"] = {
		-- 	"go",
		-- },
	})
end

if not pcall(debug.getlocal, 4, 1) then
	M.setup()
end

return M
