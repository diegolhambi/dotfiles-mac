require("monokai").setup({
    palette = require("monokai").soda
})

function ColorMyPencils(color) 
	color = color or "monokai"
    vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()