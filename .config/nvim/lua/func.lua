----------------------
-- Custom Functions --
----------------------
--
-- Shortcuts for Compiling Files
function Compile()
	local filename = vim.fn.expand("%")
	local filetype = vim.bo.filetype
	local command
	local interpreted = false
	local time = "/usr/bin/time -f '\ntook: %es'"
	local interpreted_langs = { "c", "python", "lua" }

	for _, v in ipairs(interpreted_langs) do
		if v == filetype then
			interpreted = true
			break
		end
	end

	-- Define commands based on file type
	if filetype == "rmd" then
		command = "Rscript -e \"rmarkdown::render('" .. filename .. "', output_format = 'pdf_document')\""
	elseif filetype == "c" then
		command = "tcc -run" .. " " .. filename
	elseif filetype == "python" then
		command = "python3" .. " " .. filename
	elseif filetype == "lua" then
		command = "lua" .. " " .. filename
	end

	if interpreted == true then
		command = time .. " " .. command
	end

	-- Display the starting message
	vim.api.nvim_echo({ { "→ Compilation for filetype " .. filetype .. " triggered.", "Search" } }, false, {}) -- Greenish

	if interpreted then
		local result = vim.fn.system(command)

		if vim.v.shell_error == 0 then
			vim.api.nvim_echo({ { "✓ Compilation successful!", "MoreMsg" } }, false, {}) -- Greenish
			vim.api.nvim_out_write(result)
		else
			vim.api.nvim_echo({ { "✗ Compilation failed", "ErrorMsg" } }, false, {}) -- Red
			vim.api.nvim_out_write("ERROR: " .. result)
		end
	else
		-- use jobstart for background execution
		vim.fn.jobstart(command, {
			stdout_buffered = false,
			stderr_buffered = false,
			on_stdout = function(_, data)
				for _, line in ipairs(data) do
					if line ~= "" then
						vim.api.nvim_out_write(line .. "\n")
					end
				end
			end,
			on_stderr = function(_, data)
				for _, line in ipairs(data) do
					if line ~= "" then
						vim.api.nvim_out_write("ERROR: " .. line .. "\n")
					end
				end
			end,
			on_exit = function(_, exit_code)
				if exit_code == 0 then
					vim.api.nvim_echo({ { "✓ Compilation successful!", "MoreMsg" } }, false, {}) -- Greenish
				else
					vim.api.nvim_echo({ { "✗ Compilation failed", "ErrorMsg" } }, false, {}) -- Red
				end
			end,
		})
	end
end
