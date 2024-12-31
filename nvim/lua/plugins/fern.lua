--
--  fern.lua
--  ファイラー系プラグイン fernの設定
--

vim.cmd [[
let g:fern#renderer='devicons'
let g:fern#default_hidden=1
]]

vim.cmd([[
augroup my-glyph-palette
autocmd! *
autocmd FileType fern call glyph_palette#apply()
augroup END
]])
