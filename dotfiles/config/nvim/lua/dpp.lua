local dpp_base = "~/.cache/dpp/"
local dpp_src = "$HOME/.cache/dpp/repos/github.com/Shougo/dpp.vim"

local ext_toml = "$HOME/.cache/dpp/repos/github.com/Shougo/dpp-ext-toml"
local ext_lazy = "$HOME/.cache/dpp/repos/github.com/Shougo/dpp-ext-lazy"
local ext_installer = "$HOME/.cache/dpp/repos/github.com/Shougo/dpp-ext-installer"
local ext_git = "$HOME/.cache/dpp/repos/github.com/Shougo/dpp-protocol-git"
local denops_src = "$HOME/.cache/dpp/repos/github.com/vim-denops/denops.vim"

local dpp_config = "~/.config/nvim-dpp/dpp.ts"

-- vim.opt.runtimepath:append(denops_src)
vim.opt.runtimepath:prepend(dpp_src)

vim.opt.runtimepath:append(ext_toml)
vim.opt.runtimepath:append(ext_git)
vim.opt.runtimepath:append(ext_lazy)
vim.opt.runtimepath:append(ext_installer)

if vim.fn["dpp#min#load_state"](dpp_base) then
    vim.opt.runtimepath:prepend(denops_src)

    vim.api.nvim_create_augroup("ddp", {})

    vim.cmd(string.format("autocmd User DenopsReady call dpp#make_state('%s', '%s')", dpp_base, dpp_config))
end

vim.cmd("filetype indent plugin on")

if vim.fn.has("syntax") then
    vim.cmd("syntax on")
end
