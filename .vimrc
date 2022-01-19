"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" .vimrc
"""_* Basics ===========================================================
scriptencoding utf-8
set encoding=utf-8

"""_ * Plugins ---------------------------------------------------------
execute pathogen#infect()

"""_ * GUI -------------------------------------------------------------
syntax      enable
colorscheme gruvbox
set         background=dark
hi          Comment cterm=italic
set         hlsearch
set         list listchars=tab:▸\
highlight   SpecialKey ctermfg=red
set         colorcolumn=100
highlight   ColorColumn ctermbg=8

"""_ * Primitives ------------------------------------------------------
filetype plugin indent on

set smarttab
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noautochdir
set autoindent

set backspace=indent,eol,start
set laststatus=2
set ruler
set number
set showcmd
set noswapfile
set nobackup
set nowb

" add beams etc to useless file list
set wildignore+=*.beam,*.dump,*~,*.o,.git,*.png,*.jpg,*.gif,.DS_Store,.eunit,deps,rel

let g:airline_powerline_fonts = 1

" Syntastic Configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1

"""_ * Mappings --------------------------------------------------------
let mapleader=" "

" easier buffer navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>w <C-w>v<C-w>li
map <leader>n :bn<CR>
map <leader>m :Magit<CR>

" Disable "normal" arrow bindings
map <Up>     <nop>
map <Down>   <nop>
map <Left>   <nop>
map <Right>  <nop>

imap <Up>    <nop>
imap <Down>  <nop>
imap <Left>  <nop>
imap <Right> <nop>
inore jj     <Esc>

map <C-m> :TagbarToggle<CR>

" tripple escape closes buffer
map  <esc><esc><esc> :bd<cr>
imap <esc><esc><esc> :bd<cr>

nnoremap <silent> n n:call HLNext(0.4)<cr>
nnoremap <silent> N N:call HLNext(0.4)<cr>

"""_* File mappings ====================================================

"""_* Misc =============================================================

let g:ale_linters = {
\   'erlang': ['syntaxerl'],
\   'python': ['flake8', 'pylint'],
\}

let g:ale_fixers = {
\   'python': ['black'],
\}

let g:ale_fix_on_save = 1

set ttimeout ttimeoutlen=50

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
highlight SpecialKey ctermfg=red guifg=red

set listchars=tab:»·
set list

function! HLNext (blinktime)
    set invcursorline
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    set invcursorline
    redraw
endfunction

" Toggle ALE quick list
noremap <Leader>l :call QFixToggle()<CR>

function! QFixToggle()
  if exists("g:qfix_win")
    lclose
    unlet g:qfix_win
  else
    lopen
    let g:qfix_win = bufnr("$")
  endif
endfunction

""" eof
