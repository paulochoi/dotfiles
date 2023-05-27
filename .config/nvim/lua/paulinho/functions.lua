
function nvim_yank_directory()
	-- Get the project folder path
	local project_path = vim.fn.getcwd()

	-- Get the current directory path
	local current_path = vim.fn.expand("%:p:h")

	-- Calculate the relative path
	local relative_path = vim.fn.fnamemodify(current_path, ":~:.")

	-- Remove leading './' from the relative path
	relative_path = string.gsub(relative_path, "^%./", "")
	vim.fn.setreg("+", relative_path)
	vim.notify('Copied "' .. relative_path .. '" to the clipboard!')
end


-- Define the function to run vimgrep and accept pattern
function run_vimgrep_accept_pattern()
	-- Prompt the user for the search pattern
	local pattern = vim.fn.input("Enter search pattern: ")

	-- Prompt the user for the search location
	local location = vim.fn.input("Enter search location (leave blank for current buffer, '.' for all files): ")

	-- Set the default location to the current buffer
	if location == "" then
		location = "%"
	end

	-- Run vimgrep with the pattern and the location
	if location == "." then
		vim.cmd("vimgrep /" .. pattern .. "/ **")
	else
		vim.cmd("vimgrep /" .. pattern .. "/ " .. location)
	end

	-- Open the quickfix window to display the search results
	vim.cmd("copen")
end

