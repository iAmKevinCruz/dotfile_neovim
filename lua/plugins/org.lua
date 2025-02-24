return {
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
     -- Setup orgmode
      require('orgmode').setup({
        -- org_agenda_files = '~/org/**/*',
        -- org_default_notes_file = '~/org/refile.org',
        org_agenda_files = '~/Library/Mobile Documents/com~apple~CloudDocs/Obsidian/Vault of Lykos/**/*',
        org_default_notes_file = '~/Library/Mobile Documents/com~apple~CloudDocs/Obsidian/Vault of Lykos/inbox.org',
        org_capture_templates = {
          t = {
            description = 'Todos',
            template = '** TODO %?\n %u\n',
            target = '~/Library/Mobile Documents/com~apple~CloudDocs/Obsidian/Vault of Lykos/inbox.org',
            headline = 'Inbox',
          },
          m = {
            description = 'Meetings',
            template = '** MEETING %? :meeting:\n SCHEDULED: %T\n *** Attendees: \n*** Notes: \n %u\n',
            target = '~/Library/Mobile Documents/com~apple~CloudDocs/Obsidian/Vault of Lykos/Timestamps/Meetings/meetings.org',
            headline = 'Meetings',
          },
          n = {
            description = 'Notes',
            template = '** %? \n %u\n',
            target = '~/Library/Mobile Documents/com~apple~CloudDocs/Obsidian/Vault of Lykos/inbox.org',
            headline = 'Inbox',
          },
          p = {
            description = 'Notes',
            template = '** %? \n %u\n',
            target = '~/Library/Mobile Documents/com~apple~CloudDocs/Obsidian/Vault of Lykos/inbox.org',
            headline = 'Inbox',
          },
        },
        org_todo_keyword_faces = {
          TODO = ':foreground #DF8C97 :weight bold', -- overrides builtin color for `TODO` keyword
          PROGRESS = ':foreground #C0A1F0 :weight bold',
          DONE = ':foreground #B1D99C :weight bold :slant italic',
          WAITING = ':foreground #EAAC86 :weight bold :slant italic',
          CANCELLED = ':foreground #C7CFF2 :weight bold :slant italic',
          MEETING = ':foreground #89dceb :weight bold',
        },
      })

      -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
      -- add ~org~ to ignore_install
      -- require('nvim-treesitter.configs').setup({
      --   ensure_installed = 'all',
      --   ignore_install = { 'org' },
      -- })
    end,
  },

  {
    "chipsenkbeil/org-roam.nvim",
    tag = "0.1.1",
    dependencies = {
      {
        "nvim-orgmode/orgmode",
        tag = "0.3.7",
      },
    },
    config = function()
      require("org-roam").setup({
        -- directory = "~/org",
        directory = "~/Library/Mobile Documents/com~apple~CloudDocs/Obsidian/Vault of Lykos",
        -- optional
        -- org_files = {
        --   "~/another_org_dir",
        --   "~/some/folder/*.org",
        --   "~/a/single/org_file.org",
        -- }
        extensions = {
          dailies = {
            directory = "Timestamps/Journal",
            templates = {
              d = {
                description = "default",
                template = "%?",
                target = "%<%Y-%m-%d-%a>.org",
              },
              -- m = {
              --   description = "meeting",
              --   template = "%?",
              --   target = "../Meetings/%<%Y-%m-%d> %[slug].org",
              -- },
            },
          },
        },
        templates = {
          d = {
            description = "default",
            template = "%?\n\n\nZettle: %<%Y%m%d%H%M%S>",
            target = "0 Inbox/%[title].org",
          },
          p = {
            description = "people",
            template = "%?",
            target = "Extras/People/%[title].org",
          },
          P = {
            description = "project",
            template = "%?",
            target = "1 Projects/%[title].org",
          },
          m = {
            description = "meeting",
            template = "%?",
            target = "Timestamps/Meetings/%<%Y-%m-%d> %[title].org",
          },
        },
      })
    end
  },

  {
    'akinsho/org-bullets.nvim', 
    config = function()
      require('org-bullets').setup()
    end
  },

  {
    'andreadev-it/orgmode-multi-key',
    event = "VeryLazy",
    config = function()
      require('orgmode-multi-key').setup()
    end
  }
}
