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
<img width="422" height="400" alt="Image" src="https://github.com/user-attachments/assets/04fc9b93-20b9-4955-8e5d-510fcd8d7104" />

