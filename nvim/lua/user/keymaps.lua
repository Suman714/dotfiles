-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
keymap("n", "J", "mzJ`z")

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

--Half-Page move
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

--Lexplorer
keymap("n", "<leader>e", ":Ex<CR>", opts)

--Terminal
keymap("n", "<leader>tt", ":vsplit | terminal<CR>", opts)
keymap("t", "<Esc>", "<C-\\><C-n>", opts)
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)

--Replace Text
keymap("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--Tmux
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Insert --

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- UndoTree
keymap("n", "<leader>u", "<cmd>lua require('undotree').toggle()<CR>")

-- Zen-Mode
keymap("n", "<leader>.", ":ZenMode<CR>", opts)

-- Telescope
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>sg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>sb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>sh", ":Telescope help_tags<CR>", opts)
keymap("n", "<leader>sk", ":Telescope keymaps<CR>", opts)
keymap("n", "<leader>sw", ":Telescope grep_string<CR>", opts)
keymap("n", "<leader>s.", ":Telescope git_files<CR>", opts)

-- Trouble
keymap("n", "<leader>se", function()
	require("trouble").toggle()
end)
keymap("n", "[d", function()
	require("trouble").next({ skip_groups = true, jump = true })
end)
keymap("n", "]d", function()
	require("trouble").next({ skip_groups = true, jump = true })
end)

-- Comment
keymap("n", "gc", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "gc", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- Neogit
keymap("n", "<leader>gg", "<cmd>lua require('neogit').open()<CR>", opts)

-- Code-Runner
keymap("n", "<C-M-n>", ":RunCode<CR>", { noremap = true, silent = false })
keymap("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = false })
keymap("n", "<leader>rft", ":RunFile tab<CR>", { noremap = true, silent = false })
keymap("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false })
keymap("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
keymap("n", "<leader>crf", ":CRFiletype<CR>", { noremap = true, silent = false })
keymap("n", "<leader>crp", ":CRProjects<CR>", { noremap = true, silent = false })

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
