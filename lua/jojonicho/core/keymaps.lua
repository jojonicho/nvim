vim.g.mapleader = "\\"

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- 6
-- commenting
do
	local operator_rhs = function()
		return require("vim._comment").operator()
	end
	vim.keymap.set({ "n", "x" }, "<C-_>", operator_rhs, { expr = true, desc = "Toggle comment" })

	local line_rhs = function()
		return require("vim._comment").operator() .. "_"
	end
	vim.keymap.set("n", "<C-_>", line_rhs, { expr = true, desc = "Toggle comment line" })

	local textobject_rhs = function()
		require("vim._comment").textobject()
	end
	vim.keymap.set({ "o" }, "<C-_>", textobject_rhs, { desc = "Comment textobject" })
end

-- compiling stuff (competitive programming)
-- Set the path for the AtCoder library
local acl_path = "~/Desktop/cppstuff/atcoder/ac-library"

-- Function to create a custom mapping for specific file types
local function map_filetype(filetype, command)
	vim.api.nvim_create_autocmd("FileType", {
		pattern = filetype,
		callback = function()
			vim.api.nvim_buf_set_keymap(0, "n", "<C-s>", command, { noremap = true, silent = true })
		end,
	})
end

-- C++ mapping
map_filetype(
	"cpp",
	":w<CR>:vsplit<CR>:terminal g++-12 %:r.cpp -std=c++17 -I "
		.. acl_path
		.. " -Wshift-overflow=2 -g -o %:r -D LOCAL && ./%:r<CR>i"
)

-- Python mapping
map_filetype("python", ":w<CR>:vsplit<CR>:terminal python3 %:r.py<CR>i")

-- Go mapping
map_filetype("go", ":w<CR>:vsplit<CR>:terminal go run %:r.go<CR>i")

-- Rust mapping
map_filetype("rust", ":w<CR>:vsplit<CR>:terminal cargo run %:r.rs<CR>i")

-- Java mapping
map_filetype("java", ":w<CR>:vsplit<CR>:terminal javac %:r.java && java %:r<CR>i")

-- TODO: migrate these
-- autocmd BufNewFile *.cpp 0r ~/Desktop/cppstuff/codeforces/template/a.cpp | 80
-- autocmd BufNewFile,BufRead *.cpp setlocal foldmethod=marker | set foldopen-=hor | set foldopen-=block

-- Autocommands
vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*.cpp",
	command = "0r ~/Desktop/cppstuff/codeforces/template/a.cpp | 80",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.cpp",
	command = "setlocal foldmethod=marker | set foldopen-=hor | set foldopen-=block",
})
