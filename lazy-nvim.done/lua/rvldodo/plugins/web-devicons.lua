return {
	"nvim-tree/nvim-web-devicons",
	config = function()
		require("nvim-web-devicons").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			override = {
				zsh = {
					icon = "?",
					color = "#428850",
					cterm_color = "65",
					name = "Zsh",
				},
			},
			default = true,
		})
	end,
}
