local M = {}

function M.setup()
  require('dashboard').setup {
    theme = 'doom',
    config = {
      header = {
        "        ",
        "        ",
        "        ",
        "        ",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⢀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⣀⣀⠀⠠⣄⣉⡶⢿⣷⣿⣷⣶⣶⣮⣄⡠⡀⡀⣠⣄⡀⠀⠀⠀⠀",
        "⠀⠀⠀⣄⡾⣫⢒⢾⣾⣿⢟⢥⣶⣶⣶⣮⣖⠾⡙⢿⣿⣦⡊⡲⣶⣆⠀⠀⠀⠀",
        "⠀⠀⠀⢬⣾⢣⣳⣿⡿⢑⣵⣿⣿⣷⠹⣿⣿⣿⣮⡳⡝⣿⣿⡔⠙⣿⣇⠀⠀⠀",
        "⠀⠀⢠⣿⡏⢲⣿⡿⣱⣿⣿⡿⡻⣱⣿⣝⢞⢿⢿⣿⣮⠎⣿⣿⡔⠸⣿⠀⠀⠀",
        "⠀⠀⡜⣾⠁⣿⣿⢳⡿⡛⠁⠌⢾⣿⣿⣿⣧⠀⠑⢝⢿⣏⠘⣿⣷⠀⣿⡆⠀⠀",
        "⠀⢀⢻⡟⣷⣿⣿⣈⣼⣾⣿⣮⣹⣿⣿⣿⣿⣾⣿⣮⣳⢝⣴⢻⣿⢸⢹⣧⡆⠀",
        "⣀⣘⣿⣧⢿⣿⣿⢿⣿⠋⠉⠉⣿⣿⣿⣿⣿⡙⠉⠙⣿⡇⢸⢸⣿⢨⠬⠭⠤⠤",
        "⢢⣝⢿⣯⡝⢿⡟⣼⣿⣿⣿⣿⣿⣿⡉⢙⣿⣿⣿⣿⣿⡏⢄⣿⡟⢰⣿⡿⡧⠇",
        "⡄⣎⣵⡙⡧⢏⢷⢑⢻⣿⣿⣿⣿⣿⣿⡿⢿⣿⣿⣿⣿⠁⣼⠏⠠⠛⣱⣴⡆⡏",
        "⣧⣿⣿⣿⣷⡉⠈⠣⢻⣿⣿⣿⣯⣟⣻⣇⣿⣿⣿⣿⡿⢑⠁⠁⢲⣿⣿⣿⣇⣷",
        "⢸⣿⣿⣿⣿⣇⠀⠀⠈⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠑⠁⠀⠀⢸⣿⣿⣿⣿⣿",
        "⢸⣿⣿⣿⣿⣿⠀⠀⠀⣀⠀⠈⠹⠛⣻⣛⠻⠉⠀⡀⢸⣀⠀⠀⣸⣿⣿⠿⢨⣿",
        "⢸⡏⣿⣿⣿⣿⣧⢰⣿⢸⡄⠁⠢⠀⣤⣤⣤⡲⠟⡁⣾⣿⣿⢸⡟⣛⣵⡇⡼⡿",
        "⢀⣟⠹⠻⣟⣛⢿⣾⢧⢀⣿⡸⢣⢾⣟⢿⢣⣼⣶⣠⣟⣛⣻⣴⡆⣿⣿⢁⠇⣦",
        "        ",
        "        ",
        "        ",
      },
    center = {
        {
          icon = ' ',
          icon_hl = 'Title',
          desc = 'Find File           ',
          desc_hl = 'String',
          key = 'f',
          keymap = 'SPC f f',
          key_hl = 'Number',
          action = 'Telescope find_files'
        },
        {
          icon = ' ',
          icon_hl = 'Title',
          desc = 'Find Dotfiles',
          desc_hl = 'String',
          key = 'd',
          keymap = 'SPC f d',
          key_hl = 'Number',
          action = 'Telescope find_files cwd=~/.config'
        },
        {
          icon = ' ',
          icon_hl = 'Title',
          desc = 'Quit Neovim        ',
          desc_hl = 'String',
          key = 'q',
          keymap = '',
          key_hl = 'Number',
          action = 'qa'
        },
      },
    }
  }
  end
return M

