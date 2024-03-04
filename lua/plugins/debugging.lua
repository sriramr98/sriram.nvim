local js_based_languages = { "javascript", "typescript" }

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
		"tpope/vim-fugitive",
        {
            "microsoft/vscode-js-debug",
            build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
        },
        {
            "mxsdev/nvim-dap-vscode-js",
            config = function()
                require("dap-vscode-js").setup({
                    debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter"),
                    adapters = {
                        "pwa-node",
                        "pwa-chrome",
                        "pwa-msedge",
                        "node-terminal",
                        "pwa-extensionHost",
                    },
                })
            end
        },
        {
            "Joakker/lua-json5",
            build = "./install.sh"
        }
	},
	config = function()
		require("dapui").setup()
		require("dap-go").setup()

		local dap, dapui = require("dap"), require("dapui")

		-- dap.adapters["pwa-node"] = {
		-- 	type = "server",
		-- 	host = "127.0.0.1",
		-- 	port = 8123,
		-- 	executable = {
		-- 		command = "js-debug-adapter",
		-- 	},
		-- }
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = 8123,
			executable = {
				command = "bash",
				-- 💀 Make sure to update this path to point to your installation
				args = { "/Users/sriram/.local/share/nvim/mason/packages/js-debug-adapter", "--port", "8123" },
			},
		}

		for _, language in ipairs(js_based_languages) do
			dap.configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch File",
					program = "${file}",
					cwd = "${workspaceFolder}",
					runtimeExecutable = "node",
				},
                {
                    type = "pwa-node",
                    request = "attach",
                    name = "Attach",
                    processId = require("dap.utils").pick_process,
                    cwd = "${workspaceFolder}",
                    sourceMaps = true
                },
                {
                    name = "---- launch.json configs ---",
                    type = "",
                    request = "launch"
                }
			}
		end

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

        local function startOrContinueDAP()
            if vim.fn.filereadable('.vscode/launch.json') then
                local dap_vscode = require('dap.ext.vscode')
                dap_vscode.load_launchjs(nil, {
                    ["pwa-node"] = js_based_languages,
                    ["node"] = js_based_languages,
                    ["chrome"] = js_based_languages,
                    ["pwa-chrome"] = js_based_languages
                })
            end

            dap.continue();
        end

		vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
		vim.keymap.set("n", "<Leader>dc", startOrContinueDAP, { desc = "Continue Debugger Execution" })
		vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>", { desc = "Terminate Debugger" })
		vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>", { desc = "Step Over" })
	end,
}
