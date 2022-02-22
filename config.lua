
vim.api.nvim_command "let g:asyncrun_open = 8"
--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
lvim.builtin.which_key.mappings["z"] = {
	name = "+Fred",
	r = { "<cmd>DevDocsUnderCursor<cr>", "DevDocsUnderCursor" },
	n = { ":edit ~/NEORG/index.norg<cr>" },
	x = { ":only<cr>" },
	a = { ":tabnew<cr>" },
	q = { "<cmd>copen<CR>" },
	h = { "[[:%s/<c-r><c-w>/<c-r><c-w>/g]]" },
	c = { ":Telescope grep_string<cr>" },
}

lvim.builtin.which_key.mappings["m"] = {
	name = "+markdown",
	m = { "<cmd>Glow<cr>" },
	a = { "<cmd>MarkdownPreview<cr>" },
}
-- lvim.builtin.which_key.mappings["d"] = {
--   name = "+markdown",
-- d = {":TranslateW<cr>"},
-- v = {":translatew<cr>"},
-- v = {":translatew<cr>"},
-- v = {":translatew<cr>"},
-- v = {":translatew<cr>"},
-- v = {":translatew<cr>"},
-- v = {":translatew<cr>"},
-- v = {":translatew<cr>"},
-- v = {":translatew<cr>"},
--   }
local opt = {}

-- vim.api.nvim_set_keymap("n", "<leader>wd", ":DevDocsUnderCursor<cr>", {})
-- vim.api.nvim_set_keymap("n", "<leader>wn", ":edit ~/NEORG/index.norg<cr>", {})
-- vim.api.nvim_set_keymap("n", " wx", ":only<cr>", opt)
-- vim.api.nvim_set_keymap("n", "<leader>wa", ":tabnew<cr>", opt)
vim.api.nvim_set_keymap("n", "²", ":CloseAll<cr>", opt)
vim.api.nvim_set_keymap("i", "²", "<C-o>:CloseAll<cr>", opt)
vim.api.nvim_set_keymap("t", "²", "<C-\\><C-n>CloseAll<cr>", opt)
-- vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>copen<CR>", opt)
-- vim.api.nvim_set_keymap("n", "<F7>", "<cmd>CMake build_all<CR>", opt)

vim.api.nvim_set_keymap("v", "*", [[y/\V<C-r>=escape(@",'/\')<CR><CR>]], {})
vim.api.nvim_set_keymap("n", "<leader>wh", [[:%s/<c-r><c-w>/<c-r><c-w>/g]], {})
-- vim.api.nvim_set_keymap("n", "<leader>wc", ":Telescope grep_string<cr>", {})
-- vim.api.nvim_set_keymap("n", "<leader>mm", "<cmd>Glow<cr>", {})
-- vim.api.nvim_set_keymap("n", "<leader>ma", "<cmd>MarkdownPreview<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>dd", ":TranslateW<cr>", opt)
vim.api.nvim_set_keymap("v", "<leader>dd", ":translatew<cr>", opt)
vim.api.nvim_set_keymap("n", "<leader>dr", ":TranslateR<cr>", opt)
vim.api.nvim_set_keymap("v", "<leader>dr", ":TranslateR<cr>", opt)
vim.api.nvim_set_keymap("n", "<leader>da", ":TranslateW!<cr>", opt)
vim.api.nvim_set_keymap("v", "<leader>da", ":TranslateW!<cr>", opt)
vim.api.nvim_set_keymap("n", "<leader>dz", ":TranslateR!<cr>", opt)
vim.api.nvim_set_keymap("v", "<leader>dz", ":TranslateR!<cr>", opt)
-- vim.api.nvim_set_keymap("n", "<leader>wS", ":lua require('spectre').open()<CR>", opt)
-- -- search current word
-- vim.api.nvim_set_keymap("n", "<leader>wsw", ":lua require('spectre').open_visual({select_word=true})<CR>", opt)
-- vim.api.nvim_set_keymap("v", "<leader>wss", ":lua require('spectre').open_visual()<CR>", opt)
-- -- search in current file
-- vim.api.nvim_set_keymap("n", "<leader>wsp", ":lua require('spectre').open_file_search()<cr>", opt)
-- vim.api.nvim_set_keymap("n", "<leader>nb", ":AsyncRun cpplint % <cr>", opt)

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "onedarker"
vim.opt.ff = "unix"
vim.opt.wrap = true
vim.opt.guifont = "monospace:h17"
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.colorcolumn = "99999"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 20
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader>sy"] = ":lua require(\"telescope\").extensions.live_grep_raw.live_grep_raw()<cr>"
lvim.keys.normal_mode["<leader>ss"] = ":Telescope grep_string<cr>"

lvim.keys.normal_mode["<leader>dd"] = ":TranslateW<cr>"
lvim.keys.normal_mode["<F7>"] = ":AsyncRun cmake --build build<cr>"
-- lvim.keys.normal_mode["²"] = ":CloseAll<cr>"

-- unmap a default keymapping
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
        -- for input mode
	i = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
		["<S-j>"] = actions.cycle_history_next,
		["<S-k>"] = actions.cycle_history_prev,
		["<A-k>"] = actions.preview_scrolling_up,
		["<A-j>"] = actions.preview_scrolling_down,
	},
	-- for normal mode
	n = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
	},
}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble", r = {"<cmd>Trouble lsp_references<cr>", "References"},
  f = {"<cmd>Trouble lsp_definitions<cr>", "Definitions"},
  d = {"<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics"},
  q = {"<cmd>Trouble quickfix<cr>", "QuickFix"},
  l = {"<cmd>Trouble loclist<cr>", "LocationList"},
  w = {"<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics"},
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.terminal.shell = "pwsh"
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"css",
	"rust",
	"java",
	"yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
-- formatters.setup({
-- 	{ command = "black", filetypes = { "python" } },
-- 	{ command = "stylua", filetypes = { "lua" } },
-- 	-- { command = "isort", filetypes = { "python" } },
-- 	-- {
-- 	--   -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
-- 	--   command = "prettier",
-- 	--   ---@usage arguments to pass to the formatter
-- 	--   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
-- 	--   extra_args = { "--print-with", "100" },
-- 	--   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
-- 	--   filetypes = { "typescript", "typescriptreact" },
-- 	-- },
-- })

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
  --{command = "flake8", filetypes = {"python"}}, --{
    ----each linter accepts a list of options identical to https
        -- : // github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
        --   --command = "shellcheck",
          -----@usage arguments to pass to the formatter-- --these cannot
  --                 contain whitespaces,
  --         options such as `--line - width 80` become either `{
  --     '--line-width', '80'
  --   }
  --   ` or `{ '--line-width=80' }
  --   ` --extra_args = {"--severity", "warning"}, --
  -- }
  -- , --{
  --   --command = "codespell",
  --   -----@usage specify which filetypes to enable
  --            .By default a providers will attach to all the filetypes it
  --                supports.--filetypes = {"javascript", "python"},
  --   --
  -- }
  -- , -- }

-- Additional Plugins
-- lvim.plugins = {
  --{"folke/tokyonight.nvim"},
      --{--"folke/trouble.nvim", --cmd = "TroubleToggle", --}, -- }
-- Additional Plugins
-- require("toggleterm").setup({
-- 	shell = "pwsh.exe", -- change the default shell
-- })
lvim.plugins = {
	{ "folke/tokyonight.nvim" },
	{
		"ggandor/lightspeed.nvim",
		event = "BufRead",
	},

	{
		"kevinhwang91/nvim-bqf",
		event = { "BufRead", "BufNew" },
		config = function()
			require("bqf").setup({
				auto_enable = true,
				preview = {
					win_height = 12,
					win_vheight = 12,
					delay_syntax = 80,
					border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
				},
				func_map = {
					vsplit = "",
					ptogglemode = "z,",
					stoggleup = "",
				},
				filter = {
					fzf = {
						action_for = { ["ctrl-s"] = "split" },
						extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
					},
				},
			})
		end,
	},
	{
		"windwp/nvim-spectre",
		event = "BufRead",
		config = function()
			require("spectre").setup()
		end,
	},
	{
		"andymass/vim-matchup",
		event = "CursorMoved",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},
	{
		"sindrets/diffview.nvim",
		event = "BufRead",
	},
	{
		"f-person/git-blame.nvim",
		event = "BufRead",
		config = function()
			vim.cmd("highlight default link gitblame SpecialComment")
			vim.g.gitblame_enabled = 0
		end,
	},
	{
		"tpope/vim-fugitive",
		-- cmd = {
		-- 	"G",
		-- 	"Git",
		-- 	"Gdiffsplit",
		-- 	"Gread",
		-- 	"Gwrite",
		-- 	"Ggrep",
		-- 	"GMove",
		-- 	"GDelete",
		-- 	"GBrowse",
		-- 	"GRemove",
		-- 	"GRename",
		-- 	"Glgrep",
		-- 	"Gedit",
		-- },
		-- ft = { "fugitive" },
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"p00f/nvim-ts-rainbow",
	},
	{
		"nvim-telescope/telescope-fzy-native.nvim",
		run = "make",
		event = "BufRead",
	},
	{
		"nvim-telescope/telescope-project.nvim",
		event = "BufWinEnter",
		setup = function()
			vim.cmd([[packadd telescope.nvim]])
		end,
	},
	{
		"folke/lsp-colors.nvim",
		event = "BufRead",
	},
	{
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({
				width = 120, -- Width of the floating window
				height = 25, -- Height of the floating window
				default_mappings = true, -- Bind default mappings
				debug = false, -- Print debug information
				opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
				post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
				-- You can use "default_mappings = true" setup option
				-- Or explicitly set keybindings
				-- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
				-- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
				-- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
			})
		end,
	},
	{
		"ahmedkhalf/lsp-rooter.nvim",
		event = "BufRead",
		config = function()
			require("lsp-rooter").setup()
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").setup()
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
	},
	{
		"npxbr/glow.nvim",
		ft = { "markdown" },
		-- run = "yay -S glow"
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		setup = function()
			vim.g.indentLine_enabled = 1
			vim.g.indent_blankline_char = "▏"
			vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
			vim.g.indent_blankline_buftype_exclude = { "terminal" }
			vim.g.indent_blankline_show_trailing_blankline_indent = false
			vim.g.indent_blankline_show_first_indent_level = false
		end,
	},
	-- {
	--   "iamcco/markdown-preview.nvim",
	--   run = "cd app && npm install",
	--   ft = "markdown",
	--   config = function()
	--     vim.g.mkdp_auto_start = 1
	--   end,
	-- },
	{
		"ethanholz/nvim-lastplace",
		event = "BufRead",
		config = function()
			require("nvim-lastplace").setup({
				lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
				lastplace_ignore_filetype = {
					"gitcommit",
					"gitrebase",
					"svn",
					"hgcommit",
				},
				lastplace_open_folds = true,
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup()
		end,
	},
	-- {
	--   "tpope/vim-surround",
	--   keys = {"c", "d", "y"},
	-- config = function ()
	--         vim.cmd("nmap ds       <Plug>Dsurround")
	--         vim.cmd("nmap cs       <Plug>Csurround")
	--         vim.cmd("nmap cS       <Plug>CSurround")
	--         vim.cmd("nmap ys       <Plug>Ysurround")
	--         vim.cmd("nmap yS       <Plug>YSurround")
	--         vim.cmd("nmap yss      <Plug>Yssurround")
	--         vim.cmd("nmap ySs      <Plug>YSsurround")
	--         vim.cmd("nmap ySS      <Plug>YSsurround")
	--         vim.cmd("xmap gs       <Plug>VSurround")
	--         vim.cmd("xmap gS       <Plug>VgSurround")
	--       end
	-- },
	{ "oberblastmeister/neuron.nvim" },
	-- fred plugin perso
	-- {
	--     "blackCauldron7/surround.nvim",
	--     config = function()
	--        require("surround").setup { mappings_style = "sandwich", prefix = "e" }
	--     end,
	--  },
	{ "stevearc/aerial.nvim" },
	{
		"voldikss/vim-translator",
		config = function()
			vim.api.nvim_set_var("translator_target_lang", "fr")
			vim.api.nvim_set_var("translator_source_lang", "en")
			vim.api.nvim_set_var("translator_proxy_url", "http://proxy.onera:80")
		end,
	},
	-- {
	--       "Shatur/neovim-cmake",
	--       config = function()
	-- require('cmake').setup({
  ----parameters_file = 'neovim.json',
  --JSON file to store information about selected target,
  -- run arguments and build type.--build_dir = '{cwd}/build',
  -- --Build directory.The expressions `{
  --   cwd
  -- }
  -- `, `{ os }
  -- ` and `{ build_type }` will be expanded with the corresponding text values.
	--   -- samples_path = script_path:parent():parent():parent() / 'samples', -- Folder with samples. `samples` folder from the plugin directory is used by default.
	--   -- default_projects_path = '~/Projects', -- Default folder for creating project.
	--   -- configure_arguments = '-D CMAKE_EXPORT_COMPILE_COMMANDS=1', -- Default arguments that will be always passed at cmake configure step. By default tells cmake to generate `compile_commands.json`.
	--   -- build_arguments = '', -- Default arguments that will be always passed at cmake build step.
	--   -- asyncrun_options = { save = 2 }, -- AsyncRun options that will be passed on cmake execution. See https://github.com/skywind3000/asyncrun.vim#manual
	--   -- target_asyncrun_options = {}, -- AsyncRun options that will be passed on target execution. See https://github.com/skywind3000/asyncrun.vim#manual
	--   -- dap_configuration = { type = 'cpp', request = 'launch' }, -- DAP configuration. By default configured to work with `lldb-vscode`.
	--   -- dap_open_command = require('dap').repl.open, -- Command to run after starting DAP session. You can set it to `false` if you don't want to open anything or `require('dapui').open` if you are using https://github.com/rcarriga/nvim-dap-ui
	-- })
	--       end,
	--    },

	{ "skywind3000/asyncrun.vim" },
	{ "skywind3000/asynctasks.vim" },

	{ "simnalamburt/vim-mundo" },
	{ "vim-scripts/DoxygenToolkit.vim" },
	{
		"kosayoda/nvim-lightbulb",
		config = function()
			vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
		end,
	},
	{
		"hrsh7th/cmp-calc",
		after = "cmp-nvim-lsp",
	},
	{
		"nacro90/numb.nvim",
		config = function()
			require("numb").setup({
                                show_numbers = true, -- Enable 'number' for the window while peeking
				show_cursorline = true, -- Enable 'cursorline' for the window while peeking
				number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
			})
		end,
	},
	{
		"rhysd/git-messenger.vim",
		config = function()
			-- vim.api.nvim_command 'let g:git_messenger_include_diff="current"'
			vim.api.nvim_command("let g:git_messenger_floating_win_opts = { 'border': 'single' }")
			vim.api.nvim_command("let g:git_messenger_no_default_mappings=v:true")
			vim.api.nvim_command("let g:git_messenger_always_into_popup=v:true")
		end,
	},
	{ "mg979/vim-visual-multi", config = function() end },
	{ "xolox/vim-misc" },
	{ "xolox/vim-colorscheme-switcher" },
	{
		"rhysd/devdocs.vim",
		config = function()
			vim.cmd([[let g:devdocs_filetype_map = {
    \   'c': 'cpp'}
    ]])
		end,
	},
	{ "nvim-neorg/neorg-telescope" },
	{
		"nvim-neorg/neorg",
		config = function()
			require("neorg").setup({
				-- Tell Neorg what modules to load
				load = {
					["core.defaults"] = {}, -- Load all the default modules
					-- ["core.integrations.telescope"] = {},
					-- ["core.keybinds"] = { -- Configure core.keybinds
					--    config = {
					--       default_keybinds = true, -- Generate the default keybinds
					--       neorg_leader = "<Leader>wo", -- This is the default if unspecified
					--    },
					-- },
					["core.norg.concealer"] = {}, -- Allows for use of icons
					["core.norg.dirman"] = { -- Manage your directories with Neorg
						config = {
							workspaces = {
								my_workspace = "~/neorg",
							},
						},
					},
					["core.norg.completion"] = {
						config = {
							engine = "nvim-cmp", -- We current support nvim-compe and nvim-cmp only
						},
					},
				},
			})
		end,
		requires = "nvim-lua/plenary.nvim",
		-- requires = "nvim-neorg/neorg-telescope",
	},
	{
		"mzlogin/vim-markdown-toc",
	},
	{ "nvim-telescope/telescope-live-grep-raw.nvim" },
}

vim.cmd([[
nnoremap << >>
nnoremap >> <<
vnoremap << >gv
vnoremap >> <gv
nnoremap dd "_dd
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap x "_x
vnoremap x "_x
nnoremap cc dd
nnoremap c d
vnoremap c d
noremap <Del> "_x
]])
vim.api.nvim_exec(
	[[

 let g:term_buf = 0
  let g:term_win = 0
let g:history_win_id = []
function History_cursor_window()
  echomsg("history_cursor_window")
  "echomsg(g:saved_winnr_previous)
  let saved_winnr = win_getid()
    "echom(g:saved_winnr_previous)
  "if saved_winnr != g:saved_winnr_previous 
    "let g:saved_winnr_previous = saved_winnr
    "echom("saved_winnr")
    "echom(saved_winnr)
    "echom("saved_winnr_prev")
    "echom(g:saved_winnr_previous)
    call add(g:history_win_id,saved_winnr)
  "endif
    "let history_win_reverse = g:history_win_id
    "call reverse(history_win_reverse)
    "call len(history_win_id)
    let indice = 0
  for elem in g:history_win_id
    let indice += 1 
    "echom(indice)
      "echo(win_id2win(elem))
      echom("indoce")
      echom(indice)
    if win_id2win(g:history_win_id[-indice]) != 0 
      echo("g:history_win_id[-indice]")
      echo(g:history_win_id[-indice])
      "echom(elem)
      let toto = g:history_win_id[-indice]
      echom("toto")
      echom(toto)
      return toto
    endif
  endfor
endfunction

function Close_all()
  let nodelete = 0
  let list_file_to_delete= []
  let list_file_to_keep = ['.vimrc','vimrcWindows' ]
  if expand('%:e') !=# ''
    let nodelete = 1
  endif
  for word in list_file_to_delete
    if expand('%:e') ==# word || expand('%:t') ==# word
      let  nodelete = 0
      break
    endif
  endfor

  for word in list_file_to_keep
    if expand('%:e') ==# word || expand('%:t') ==# word
      let  nodelete = 1
      break
    endif
  endfor

  if nodelete !=# 1
    execute "bw"
  endif
endfunction
function! CloseWindo()
  "echomsg("closewindo")
  "let saved_winnr = winnr()
  "let saved_winnr = bufname()
  let saved_winnr = win_getid()
  "echom saved_winnr
  "call feedkeys("\<c-c>")
  "call feedkeys("\<c-c>")
  call feedkeys("\<esc>")
  call feedkeys("\<esc>")
 "execute 'normal("CTRL-\ CTRL-N")
  pclose
  helpclose
  ccl
  silent! :FloatermHide!<cr>
  "silent! :CocCommand explorer --quit 
  
  "cache le terminal
  if has('nvim')
    if win_gotoid(g:term_win)
      hide
      "silent! :ToggleTermToggleAll!<cr>
    endif
  endif
  "silent! :ToggleTermToggleAll!<cr>
  windo call Close_all()
  "exec "silent! saved_winnr . 'wincmd w'"
  "exec "silent! saved_winnr . 'bufload'"
  "exec "silent! saved_winnr . 'win_gotoid'"
  "let saved_winnr = History_cursor_window()
  "echom("saved_winnr")
  "echom(saved_winnr)
  "echo saved_winnr
  call win_gotoid(saved_winnr)
  "
  "close plugin rmagatti/goto-preview
  "
silent! :lua require('goto-preview').close_all_win()
endfunction

silent! command! CloseAll call CloseWindo()
  set autoread
]],
	true
)

-- vim.api.nvim_command "set undofile"

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
  --{"BufWinEnter", "*.lua", "setlocal ts=8 sw=8"}, -- }
-- check the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "clangd" })
-- -- some settings can only passed as commandline flags `clangd --help`
-- local clangd_flags = {
--   "--all-scopes-completion",
--   "--suggest-missing-includes",
--   "--background-index",
--   "--pch-storage=disk",
--   "--cross-file-rename",
--   "--log=info",
--   "--completion-style=detailed",
--   "--enable-config", -- clangd 11+ supports reading from .clangd configuration file
--   "--clang-tidy",
--   -- "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
--   -- "--fallback-style=Google",
--   -- "--header-insertion=never",
--   -- "--query-driver=<list-of-white-listed-complers>"
-- }

-- local clangd_bin = "clangd"

-- local custom_on_attach = function(client, bufnr)
--   require("lvim.lsp").common_on_attach(client, bufnr)
--   local opts = { noremap = true, silent = true }
--   vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lh", "<Cmd>ClangdSwitchSourceHeader<CR>", opts)
-- end

-- local opts = {
--   cmd = { clangd_bin, unpack(clangd_flags) },
--   on_attach = custom_on_attach,
-- }

-- require("lvim.lsp.manager").setup("clangd", opts)
