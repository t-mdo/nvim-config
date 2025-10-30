-- Color Scheme Configuration
if vim.fn.has('termguicolors') == 1 then
  vim.opt.termguicolors = true
end
vim.o.background = "dark"

require("tokyonight").setup({
    on_highlights = function(highlights, colors)
			highlights["MatchParenCur"] = { underline = true }
			highlights["MatchParen"] = { underline = true }
			highlights["MatchWord"] = { underline = true }
			highlights["MatchWordCur"] = { underline = true }

			highlights["@keyword.import"] = { fg = colors.purple }
			highlights["@keyword.function"] = { fg = colors.red }
			highlights["@keyword.return"] = { fg = colors.red }
			highlights["@keyword.coroutine"] = { fg = colors.orange }
			highlights["@keyword"] = { fg = colors.magenta, italic = false }
			highlights["@tag.tsx"] = { fg = colors.blue5 }
			highlights["@tag.builtin.tsx"] = { fg = colors.blue1 }
			highlights["@punctuation.delimiter"] = { fg = colors.fg_dark }
			highlights["@variable.parameter"] = { fg = colors.blue8 }
			highlights["@type"] = { fg = colors.yellow }
			highlights["@type.builtin"] = { fg = colors.yellow }
		end,
});
vim.cmd.colorscheme('tokyonight-night')

vim.g.rainbow_delimiters = {
  highlight = {
    'RainbowDelimiterBlue',
    'RainbowDelimiterYellow',
    'RainbowDelimiterGreen',
    'RainbowDelimiterOrange',
    'RainbowDelimiterViolet',
    'RainbowDelimiterRed',
    'RainbowDelimiterCyan',
  },
  query = {
    [''] = 'rainbow-parens',
  },
}
