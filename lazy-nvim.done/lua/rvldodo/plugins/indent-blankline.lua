return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("ibl").setup()
	end,
	main = "ibl",
	opts = {
		indent = { char = "?" },
	},
}
