vim9script

# Function to launch Yazi in current directory
def LaunchYazi()
  execute 'silent !powershell.exe yazi ' .. shellescape(expand('%:p:h'))
enddef

# Function to open yazi.toml config
def OpenYaziConfig()
  var config_path = $APPDATA .. '/yazi/config/yazi.toml'
  if filereadable(config_path)
    execute 'edit ' .. fnameescape(config_path)
  else
    echohl WarningMsg | echom 'Yazi config not found at ' .. config_path | echohl None
  endif
enddef


def OpenYaziTheme()
  var config_path = $APPDATA .. '/yazi/config/theme.toml'
  if filereadable(config_path)
    execute 'edit ' .. fnameescape(config_path)
  else
    echohl WarningMsg | echom 'Yazi config not found at ' .. config_path | echohl None
  endif
enddef
# Replace netrw with Yazi on <Leader>e
nnoremap <silent> <Leader>e :YaziLaunch<CR>

# Add :YaziConfig command
command! YaziTheme call OpenYaziTheme()
command! YaziConfig call OpenYaziConfig()
command! YaziLaunch call LaunchYazi()
