-- Neo-tree Configuration
require("neo-tree").setup({
  event_handlers = {
    {
      event = "file_open_requested",
      handler = function()
        require("neo-tree.command").execute({ action = "close" })
      end
    }
  },
  window = {
    mappings = {
      ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
    }
  },
  filesystem = {
    follow_current_file = {
      enabled = false,
    }
  }
})
require('fzf-lua').setup({
  keymap = {
    builtin = {
      ["<C-s>"] = "toggle-preview",
    }
  },
  actions = {
    files = {
      ["default"] = require("fzf-lua.actions").file_edit,
    },
  },
  oldfiles = {
    include_current_session = true,
  },
})
require("bufferline").setup{
  options = {
    diagnostics = "nvim_lsp",
    show_buffer_close_icons = false,
    max_name_length = 30
  }
}
require('lualine').setup({
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filename'},
    lualine_x = {'filetype', 'diagnostics'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
})
