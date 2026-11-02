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
<img width="438" height="396" alt="图片" src="https://github.com/user-attachments/assets/451186ef-ae1a-4516-b12a-5f3e8bf1749c" />
