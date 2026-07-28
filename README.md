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
<img width="400" height="500" alt="Image" src="https://github.com/user-attachments/assets/3c77c54f-0e48-4098-ad91-1aadfe7241d2" />




