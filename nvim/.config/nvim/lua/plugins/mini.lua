return {
  {
    -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      local MiniFiles = require('mini.files')

      MiniFiles.setup {
        windows = {
          max_number = math.huge,
          preview = true,
          width_focus = 25,
          width_nofocus = 15,
          width_preview = 80,
        },
      }

      -- Create mapping to open files in split
            
      local map_split = function(buf_id, lhs, direction)
        local rhs = function()
          local cur_target = MiniFiles.get_explorer_state().target_window
          local new_target = vim.api.nvim_win_call(cur_target, function()
            vim.cmd(direction .. ' split')
            return vim.api.nvim_get_current_win()
          end)

          MiniFiles.set_target_window(new_target)
          -- Optional: open file immediately
          -- MiniFiles.go_in()
        end

        local desc = 'Split ' .. direction
        vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
      end

      vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniFilesBufferCreate',
        callback = function(args)
          local buf_id = args.data.buf_id
          map_split(buf_id, '<C-s>', 'belowright horizontal')
          map_split(buf_id, '<C-v>', 'belowright vertical')
          map_split(buf_id, '<C-t>', 'tab')
        end,
      })

        -- Create mapping to show/hide dot-files ~
            
      local show_dotfiles = true

      local filter_show = function(fs_entry) return true end

      local filter_hide = function(fs_entry)
        return not vim.startswith(fs_entry.name, '.')
      end

      local toggle_dotfiles = function()
        show_dotfiles = not show_dotfiles
        local new_filter = show_dotfiles and filter_show or filter_hide
        MiniFiles.refresh({ content = { filter = new_filter } })
      end

      vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniFilesBufferCreate',
        callback = function(args)
          local buf_id = args.data.buf_id
          -- Tweak left-hand side of mapping to your liking
          vim.keymap.set('n', 'g.', toggle_dotfiles, { buffer = buf_id })
        end,
      })

      -- Setup other mini modules

      -- Minimap
      -- require('mini.map').setup()
    end,
  },

  { 'nvim-mini/mini.map', 
    version = '*',
    config = function()
      local map = require('mini.map')
      map.setup({
        symbols = { encode = map.gen_encode_symbols.dot('4x2') },
        integrations = {
          map.gen_integration.builtin_search(),
          map.gen_integration.diagnostic(),
          map.gen_integration.gitsigns(),
        },
        window = { winblend = 50, width = 12 },
      })

    vim.keymap.set('n', '<Leader>mc', MiniMap.close, { desc = 'Minimap close' })
    vim.keymap.set('n', '<Leader>mf', MiniMap.toggle_focus, { desc = 'Minimap focus' })
    vim.keymap.set('n', '<Leader>mo', MiniMap.open, { desc = 'Minimap open' })
    vim.keymap.set('n', '<Leader>mr', MiniMap.refresh, { desc = 'Minimap refresh' })
    vim.keymap.set('n', '<Leader>ms', MiniMap.toggle_side, { desc = 'Minimap toggle side' })
    vim.keymap.set('n', '<Leader>mt', MiniMap.toggle, { desc = 'Minimap toggle' })
    end,
  },

  {
    -- Mini hipatterns highlights TODO, FIXME, NOTE, etc.
    'echasnovski/mini.hipatterns',
    version = '*',
    config = function()
      local hipatterns = require('mini.hipatterns')
      hipatterns.setup({
        highlighters = {
          fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
          hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
          todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
          note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

          -- Highlight hex color strings (#rrggbb)
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })
    end,
  },
}
