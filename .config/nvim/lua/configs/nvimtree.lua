local ignore_dirs = {
  "^.bundle",
  "^build",
  "^storage",
  "^.yardoc",
  "^node_modules",
  "^cache",
  "^pids",
  "^sockets",
  "^public",
  "^vendor",
  "^.git",
  "^.github",
  "^.dockerdev",
  "^docs",
  "^log",
  "^.sass-cache",
}

return {
  git = {
    enable = true,
  },
  -- modified = {
  --   enable = true,
  --   show_on_dirs = true,
  --   show_on_open_dirs = true,
  -- },
  filters = {
    enable = true,
    git_ignored = true, -- Hide git ignored files by default
    dotfiles = false,
    custom = ignore_dirs,
    exclude = {
      "config/application.yml",
      "config/master.key",
      "config/secrets.yml",
      "config/settings.local.yml",
      "config/database.yml",
      "tmp",
      "tmp/raw_dev",
    },
  },
  renderer = {
    -- add_trailing = true,
    -- highlight_modified = "icon",
    -- highlight_git = "icon",
    icons = {
      show = {
        git = true,
        -- modified = true,
      },
    },
  },
  -- filesystem_watchers = {
  -- ignore_dirs = ignore_dirs,
  -- },
}
