#### Vim plugin for mach language
https://machlang.org  

Install using [vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'angluca/mach.vim'
```
Set lsp if you want
```vim
Plug 'yegappan/lsp'

setl omnifunc=LspOmniFunc
au filetype mach call LspAddServer([#{
            \    name: 'mach',
            \    filetype: ['mach'],
            \    path: 'mls',
            \  }])
```
<img width="926" height="503" alt="Image" src="https://github.com/user-attachments/assets/baba9dcd-cb4a-47e1-bdc0-432c2cba7038" />
