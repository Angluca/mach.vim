#### Vim plugin for mach language
https://machlang.org  
https://github.com/briar-systems/mach-lsp

Install using [vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'yegappan/lsp'
Plug 'angluca/mach.vim'
```
Setting lsp
```vim
g:lsp_options = {
    outlineOnRight: true,
    outlineWinSize: 30,
    autoComplete: true,
    incrementalSync: true,
    snippetSupport: false,
    vsnipSupport: true,
    filterCompletionDuplicates: true,
}

def g:MyLspSetup()
  g:LspOptionsSet(g:lsp_options)
  g:LspAddServer([
    { name: 'mach', filetype: ['mach'], path: exepath('mls') },
  ])
enddef
au User LspSetup call g:MyLspSetup()
```
This image color  
[vimfiles/colors/maroloccio.vim](https://github.com/Angluca/AcVim/blob/master/vimfiles/colors/maroloccio.vim)
```vim
colorscheme maroloccio
```
<img width="400" height="380" alt="图片" src="https://github.com/user-attachments/assets/9498e083-7d6b-4297-92c7-05363900459a" />
