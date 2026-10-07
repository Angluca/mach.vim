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
setl omnifunc=LspOmniFunc
def g:MyLspSetup()
  g:LspOptionsSet(g:lsp_options)
  g:LspAddServer([
    { name: 'mach', filetype: ['mach'], path: exepath('mls') },
  ])
enddef
au User LspSetup call g:MyLspSetup()
```
<img width="926" height="503" alt="Image" src="https://github.com/user-attachments/assets/baba9dcd-cb4a-47e1-bdc0-432c2cba7038" />

