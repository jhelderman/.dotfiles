call plug#begin()
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
" Plug 'ghifarit53/tokyonight-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'psf/black', { 'branch': 'stable' }
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install --frozen-lockfile --production',
        \ 'branch': 'release/0.x'
  \ }
Plug 'joshdick/onedark.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets'
Plug 'puremourning/vimspector'
call plug#end()

" basic settings
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set shiftwidth=4
set ruler
set showcmd
set cursorline
filetype indent plugin on
set wildmenu
set lazyredraw
set showmatch
set signcolumn=yes
set noswapfile
" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" disable comment continuation because it's annoying
set formatoptions-=cro

" shortcuts
nnoremap <SPACE> <Nop>
let mapleader = " "
" movement
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv
" fzf
nmap <leader><tab> <plug>(fzf-maps-n)
nnoremap <leader>sf :Files<CR>
nnoremap <leader>sg :Rg<CR>
nnoremap <leader><leader> :Buffers<CR>
" file I/O
nnoremap <leader>fs :w<CR>
nnoremap <leader>fl :e<CR>
" util
nnoremap <leader>so :so<CR>
" NERDTree
nnoremap <leader>fo :NERDTreeFocus<CR>
nnoremap <leader>fe :NERDTreeToggle<CR>
nnoremap <leader>fi :NERDTreeFind<CR>
" black
nnoremap <leader>fp :Black<CR>
" vimspector
nnoremap <leader>db <Plug>VimspectorToggleBreakpoint
nnoremap <leader>dc <Plug>VimspectorContinue
nnoremap <leader>dq <Plug>VimspectorStop
nnoremap <leader>dn <Plug>VimspectorStepOver
nnoremap <leader>ds <Plug>VimspectorStepInto
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" color scheme
set termguicolors
if (has("autocmd") && !has("gui_running"))
    augroup colorset
        autocmd!
        let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
        autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
    augroup END
endif
colorscheme onedark
" hi Normal guibg=NONE ctermbg=NONE
" hi NormalNC guibg=NONE ctermbg=NONE
" hi NormalSB guibg=NONE ctermbg=NONE
" hi NormalFloat guibg=NONE ctermbg=NONE
hi Terminal guibg=NONE ctermbg=NONE

" coc
set encoding=utf-8
set nobackup
set nowritebackup
set updatetime=300
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
                  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
endfunction
if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
else
      inoremap <silent><expr> <c-@> coc#refresh()
endif
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
      if CocAction('hasProvider', 'hover')
              call CocActionAsync('doHover')
                else
                        call feedkeys('K', 'in')
                          endif
endfunction
nmap <leader>rn <Plug>(coc-rename)
nnoremap <silent><nowait> <leader>ca  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <leader>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <leader>co  :<C-u>CocList outline<cr>
" Search workleader symbols
nnoremap <silent><nowait> <leader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <leader>cp  :<C-u>CocListResume<CR>
