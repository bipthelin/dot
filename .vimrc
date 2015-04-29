"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" .vimrc
"""_* Basics ===========================================================
scriptencoding utf-8
set encoding=utf-8

"""_ * Plugins ---------------------------------------------------------
execute pathogen#infect()

"""_ * GUI -------------------------------------------------------------
syntax      enable
set         background=dark
let         g:solarized_termtrans = 1
let         g:solarized_visibility =  "low"
colorscheme solarized
set         hlsearch
set         list listchars=tab:▸\
highlight   SpecialKey ctermfg=red
set         colorcolumn=80

if has('gui_running')
    "set background=light
    set guifont=Inconsolata\ for\ Powerline:h14
    let g:airline_powerline_fonts = 1
    set go-=T
    set go-=l
    set go-=L
    set go-=r
    set go-=R
endif

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
set number
set showcmd
set noswapfile
set nobackup
set nowb

" add beams etc to useless file list
set wildignore+=*.beam,*.dump,*~,*.o,.git,*.png,*.jpg,*.gif,.DS_Store,.eunit,deps,rel

"""_ * Mappings --------------------------------------------------------
" easier buffer navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>w <C-w>v<C-w>li
map <leader>n :bn<CR>
map <leader>t :TagbarOpenAutoClose<CR>
map <leader>m :NERDTreeToggle<CR>

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

" Mapping to move lines
nnoremap <D-j> :m      .+1<CR>==
nnoremap <D-k> :m      .-2<CR>==
inoremap <D-j> <Esc>:m .+1<CR>==gi
inoremap <D-k> <Esc>:m .-2<CR>==gi
vnoremap <D-j> :m      '>+1<CR>gv=gv
vnoremap <D-k> :m      '<-2<CR>gv=gv

" tripple escape closes buffer
map  <esc><esc><esc> :bd<cr>
imap <esc><esc><esc> :bd<cr>

nnoremap <silent> n n:call HLNext(0.4)<cr>
nnoremap <silent> N N:call HLNext(0.4)<cr>

"""_* File mappings ====================================================
au BufNewFile,BufRead *.hs  setlocal noet ts=2 sw=2 sts=2
au BufNewFile,BufRead *.erl setlocal noet ts=4 sw=4 sts=4
au BufNewFile,BufRead *.hrl setlocal noet ts=4 sw=4 sts=4
au BufNewFile,BufRead *.md  setlocal noet ts=4 sw=4

"""_* Functions ========================================================
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

""" eof
