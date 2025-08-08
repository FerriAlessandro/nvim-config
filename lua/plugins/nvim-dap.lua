return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"mfussenegger/nvim-dap-python",
			"williamboman/mason.nvim",
		},
		config = function()
			local dap = require "dap"
			local ui = require "dapui"

			require("dapui").setup()
			require("dap-go").setup()

			require("nvim-dap-virtual-text").setup {
				-- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
				display_callback = function(variable)
					local name = string.lower(variable.name)
					local value = string.lower(variable.value)
					if name:match "secret" or name:match "api" or value:match "secret" or value:match "api" then
						return "*****"
					end

					if #variable.value > 15 then
						return " " .. string.sub(variable.value, 1, 15) .. "... "
					end

					return " " .. variable.value
				end,
			}
			-- Python debugger setup
			vim.fn.sign_define("DapBreakpoint", {
				text = "",
				texthl = "DiagnosticSignError",
				linehl = "",
				numhl = "",
			})

			vim.fn.sign_define("DapBreakpointRejected", {
				text = "", -- or "❌"
				texthl = "DiagnosticSignError",
				linehl = "",
				numhl = "",
			})

			vim.fn.sign_define("DapStopped", {
				text = "", -- or "→"
				texthl = "DiagnosticSignWarn",
				linehl = "Visual",
				numhl = "DiagnosticSignWarn",
			})
			local dap_python = require("dap-python")
			local python_path = vim.fn.exepath("python3") -- or set to a venv: "/path/to/venv/bin/python"
			dap_python.setup(python_path)

			vim.keymap.set("n", "<space>db", dap.toggle_breakpoint)
			vim.keymap.set("n", "<space>gb", dap.run_to_cursor)
			-- Eval var under cursor
			vim.keymap.set("n", "<space>?", function()
				require("dapui").eval(nil, { enter = true })
			end)

			vim.keymap.set("n", "<space>dc", dap.continue)
			vim.keymap.set("n", "<space>di", dap.step_into)
			vim.keymap.set("n", "<space>do", dap.step_over)
			vim.keymap.set("n", "<space>dO", dap.step_out)
			vim.keymap.set("n", "<space>dp", dap.step_back)
			vim.keymap.set("n", "<space>dr", dap.restart)

			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end
		end,
	},
}
