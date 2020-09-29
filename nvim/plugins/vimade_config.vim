let g:vimade = {
  \ "normalid": '',
  \ "normalncid": '',
  \ "basefg": '',
  \ "basebg": '',
  \ "fadelevel": 0.4,
  \ "colbufsize": 15, "15 is the default for gui vim, 5 is the default for terminals and gvim
  \ "rowbufsize": 15, "15 is the default for gui vim, 0 is the default for terminals and gvim
  \ "checkinterval": 100, "100 is the default for gui vim, 500 is the default for terminals and neovim
  \ "usecursorhold": 0, "0 is default, but will automatically set to 1 for Windows GVIM
  \ "detecttermcolors": 0,
  \ 'enablescroll': 1, "1 is the default for gui vim, but will automatically set to 0 for terminals and Windows GVIM.
  \ 'enablesigns': g:vimade_features.has_signs_priority, "enabled for vim/nvim versions that support sign priority.  Older vim/nvim versions may suffer performance issues
  \ 'signsid': 13100,
  \ 'signsretentionperiod': 4000,
  \ 'fademinimap': 1,
  \ 'fadepriority': 10,
  \ 'groupdiff': 1,
  \ 'groupscrollbind': 0,
  \ 'enablefocusfading': 0,
  \ 'enablebasegroups': 1,
 \ 'basegroups': ['Folded', 'Search', 'SignColumn', 'LineNr', 'CursorLine', 'CursorLineNr', 'DiffAdd', 'DiffChange', 'DiffDelete', 'DiffText', 'FoldColumn', 'Whitespace']
}
