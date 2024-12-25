return {
	"p00f/cphelper.nvim",
	-- nnoremap <C-c> <Esc>:w<CR>:%y+<CR>:CphTest<CR>
	-- nnoremap <C-v> <Esc>:w<CR>:%y+<CR>:CphRetest<CR>
	--
	-- autocmd BufNewFile *.cpp 0r ~/Desktop/cppstuff/codeforces/template/a.cpp | 80
	-- autocmd BufNewFile,BufRead *.cpp setlocal foldmethod=marker | set foldopen-=hor | set foldopen-=block

	event = { "BufReadPre", "BufNewFile" },
	-- Key mappings
	config = function()
		-- Map <C-c> to save, yank entire buffer, and run :CphTest
		vim.api.nvim_set_keymap("n", "<C-c>", "<Esc>:w<CR>:%y+<CR>:CphTest<CR>", { noremap = true })

		-- Map <C-v> to save, yank entire buffer, and run :CphRetest
		vim.api.nvim_set_keymap("n", "<C-v>", "<Esc>:w<CR>:%y+<CR>:CphRetest<CR>", { noremap = true })
	end,
}
