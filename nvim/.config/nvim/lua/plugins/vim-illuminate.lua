return {
	"RRethy/vim-illuminate",
	lazy = true, -- making this lazy loaded till i'm figuring out if I need it
	config = function()
		require("illuminate").configure({})
	end,
}
