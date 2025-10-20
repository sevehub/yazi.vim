vim9script

const config_path = has('win32') ?
    $APPDATA .. '/yazi/config' :
    $XDG_CONFIG_HOME != '' ?
        $XDG_CONFIG_HOME .. '/yazi' :
        $HOME .. '/.config/yazi'

const shell_cmd = has('win32') ?
    'powershell.exe' :
    executable('zsh') ? 'zsh' :
    executable('bash') ? 'bash' :
    'sh'
# Function to launch Yazi in current directory
def LaunchYazi()
  execute 'silent !' .. shell_cmd .. ' yazi ' .. shellescape(expand('%:p:h'))
enddef

# Function to open yazi.toml config
def OpenYaziConfig()
  const config_yazi = config_path .. '/yazi.toml'
  if filereadable(config_yazi)
    execute 'edit ' .. fnameescape(config_yazi)
  else
    echohl WarningMsg | echom 'Yazi config not found at ' .. config_path | echohl None
  endif
enddef

def OpenYaziKeymap()
  const config_keymap = config_path .. '/keymap.toml'
  if filereadable(config_keymap)
    execute 'edit ' .. fnameescape(config_keymap)
  else
    echohl WarningMsg | echom 'Yazi config not found at ' .. config_path | echohl None
  endif
enddef


def OpenYaziTheme()
  const config_theme = config_path .. '/theme.toml'
  if filereadable(config_theme)
    execute 'edit ' .. fnameescape(config_theme)
  else
    echohl WarningMsg | echom 'Yazi config not found at ' .. config_path | echohl None
  endif
enddef
# Replace netrw with Yazi on <Leader>e
nnoremap <silent> <Leader>e :YaziLaunch<CR>

# Add :YaziConfig command
command! YaziTheme call OpenYaziTheme()
command! YaziConfig call OpenYaziConfig()
command! YaziKeymap call OpenYaziKeymap()
command! YaziLaunch call LaunchYazi()
