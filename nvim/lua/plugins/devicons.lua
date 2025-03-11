--
-- devicons.lua
-- アイコン関連のプラグインの設定
--

require'nvim-web-devicons'.setup {
  override = {
    zsh = {
      icon = "",
      color = "#428850",
      cterm_color = "65",
      name = "Zsh"
    }
  };
  color_icons = true;
  default = true;
  strict = true;
  variant = "light|dark";
  override_by_filename = {
    [".gitignore"] = {
      icon = "",
      color = "#f15000",
      name = "Gitignore"
    }
  };
  override_by_extension = {
    ["log"] = {
      icon = "",
      color = "#81e043",
      name = "Log"
    }
  };
  override_by_operating_system = {
    ["apple"] = {
      icon = "",
      color = "#A2AAAD",
      cterm_color = "248",
      name = "Apple",
    },
  };
}

vim.g.fern_renderer_devicons_disable_warning = 1
