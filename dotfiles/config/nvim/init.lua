------------------------------------------------------------------
---  init.lua
------------------------------------------------------------------

-- dpp settings
local dpp_base = "~/.cache/dpp/"
local dpp_src = "~/.cache/dpp/repos/github.com/Shougo/dpp.vim"

local ext_toml = "$HOME/.cache/dpp/repos/github.com/Shougo/dpp-ext-toml"
local ext_lazy = "$HOME/.cache/dpp/repos/github.com/Shougo/dpp-ext-lazy"
local ext_installer = "$HOME/.cache/dpp/repos/github.com/Shougo/dpp-ext-installer"
local ext_git = "$HOME/.cache/dpp/repos/github.com/Shougo/dpp-protocol-git"
local denops_src = "$HOME/.cache/dpp/repos/github.com/vim-denops/denops.vim"

local dpp_config = "~/.config/nvim-dpp/dpp.ts"

vim.opt.runtimepath:append(denops_src)
vim.opt.runtimepath:prepend(dpp_src)
local dpp = require("dpp")

vim.opt.runtimepath:append(ext_toml)
vim.opt.runtimepath:append(ext_git)
vim.opt.runtimepath:append(ext_lazy)
vim.opt.runtimepath:append(ext_installer)

if dpp.load_state(dpp_base) then
    vim.opt.runtimepath:prepend(denops_src)

    vim.api.nvim_create_autocmd("User", {
        pattern = "DenopsReady",
        callback = function()
            vim.notify("dpp load_state() is failed")
            dpp.make_state(dpp_base, dpp_config)
        end,
    })
end

if vim.fn["dpp#min#load_state"](dpp_base) then
    vim.opt.runtimepath:prepend(denops_src)
    vim.api.nvim_create_autocmd("User", {
        pattern = "DenopsReady",
        callback = function()
            dpp.make_state(dpp_base, dpp_config)
        end,
    })
end

vim.api.nvim_create_autocmd("User", {
    pattern = "Dpp:makeStatePost",
    callback = function()
        vim.notify("dpp make_state is done()")
    end,
})

vim.cmd("filetype indent plugin on")
vim.cmd("syntax on")

-- dpp install commands
vim.api.nvim_create_user_command("DppInstall", "call dpp#async_ext_action('installer', 'install')", {})

-- dpp upgrade commands
vim.api.nvim_create_user_command("DppUpdate", function(opts)
    local args = opts.fargs
    vim.fn["dpp#async_ext_action"]('installer', 'update', { names = args })
end, { nargs = "*" })

-- plugin settings
require("plugins/lualine")
