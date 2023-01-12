-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- packer can manage itself

  -- colorschemes and UX
  use("folke/tokyonight.nvim")
  use("ellisonleao/gruvbox.nvim")
  use("kyazdani42/nvim-web-devicons")
  use('nvim-lua/popup.nvim')
  use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

  use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

  use("numToStr/Comment.nvim") -- commenting with gc

  use("nvim-lualine/lualine.nvim") -- statusline

  -- autocompletion
  use({"neoclide/coc.nvim", branch = "release" })
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-path")
  use("hrsh7th/nvim-cmp")
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
  use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis

  -- ruby
  use("RRethy/nvim-treesitter-endwise")

  -- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
  use("nvim-telescope/telescope-file-browser.nvim")

  -- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

  if packer_bootstrap then
		require("packer").sync()
	end
end)
