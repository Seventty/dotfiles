"--- Sets configuration ---"
set nocompatible            " disable compatibility to old-time vi
so ~/.config/nvim/plugins/plugins.vim
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set relativenumber
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set encoding=utf-8
set shortmess+=c
set signcolumn=number

" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

"--- Turning on the themes --"
set termguicolors
set background=dark
colorscheme palenight

"--- Keymaps and user config ---"
let mapleader=" " "Use the spacebar as leadercap to run command faster
nmap <leader>nt :NERDTreeFind<CR>
nmap <leader>t :below terminal<CR>
nmap <leader>qq :q!<CR>
nmap <leader>q :q<CR>
nmap <leader>w :w<CR>
nmap <leader>wq :wq<CR>
nmap <leader>pi :PlugInstall<CR>
imap ii <Esc>
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> K :call CocAction('doHover')<CR>
nmap <leader>do <Plug>(coc-codeaction)
autocmd VimEnter * AS


"Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Auto nerdtree like file Explorer
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree
let g:NERDTreeIgnore = ['^node_modules$']

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Javascript Concealing Characters
"let g:javascript_conceal_function             ="ƒ"
"let g:javascript_conceal_null                 ="ø"
"let g:javascript_conceal_this                 ="@"
"let g:javascript_conceal_return               ="<"
"let g:javascript_conceal_undefined            ="¿"
"let g:javascript_conceal_NaN                  ="ℕ"
"let g:javascript_conceal_prototype            ="¶"
"let g:javascript_conceal_static               ="•"
"let g:javascript_conceal_super                ="Ω"
"let g:javascript_conceal_arrow_function       =">"
"let g:javascript_conceal_noarg_arrow_function ="🞅"
"let g:javascript_conceal_underscore_arrow_function ="🞅"

" Changing default NERDTree arrow
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nnoremap <C-t> :NERDTreeToggle<CR>

" Automatic airline tab
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'

set noshowmode
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = 'arrow_forward'
let g:airline_right_sep = '«'
let g:airline_right_sep = 'arrow_backward'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") 
      \ && b:NERDTree.isTabTree()) | q | endif

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
