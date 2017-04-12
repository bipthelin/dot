"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" .vimrc
"""_* Basics ===========================================================
scriptencoding utf-8
set encoding=utf-8

"""_ * Plugins ---------------------------------------------------------
execute pathogen#infect()

"""_ * GUI -------------------------------------------------------------
syntax      enable
colorscheme space-vim-dark
hi          Comment cterm=italic
set         hlsearch
set         list listchars=tab:▸\
highlight   SpecialKey ctermfg=red
set         colorcolumn=80
highlight   ColorColumn ctermbg=0*

let g:airline_powerline_fonts = 1

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

" tripple escape closes buffer
map  <esc><esc><esc> :bd<cr>
imap <esc><esc><esc> :bd<cr>

nnoremap <silent> n n:call HLNext(0.4)<cr>
nnoremap <silent> N N:call HLNext(0.4)<cr>

"""_* File mappings ====================================================
au BufNewFile,BufRead *.hs  setlocal ts=2 sw=2 sts=2
au BufNewFile,BufRead *.erl setlocal ts=4 sw=4 sts=4
au BufNewFile,BufRead *.hrl setlocal ts=4 sw=4 sts=4
au BufNewFile,BufRead *.md  setlocal noet ts=4 sw=4

"""_* Functions ========================================================
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

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

" ale {
    let g:ale_set_highlights = 0
    " If emoji not loaded, use default sign
    try
        let g:ale_sign_error = emoji#for('boom')
        let g:ale_sign_warning = emoji#for('small_orange_diamond')
    catch
        " Use same sign and distinguish error and warning via different colors.
        let g:ale_sign_error = '•'
        let g:ale_sign_warning = '•'
    endtry
    let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
    let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']

    " For a more fancy ale statusline
    function! ALEGetError()
        let l:res = ale#statusline#Status()
        if l:res ==# 'OK'
            return ''
        else
            let l:e_w = split(l:res)
            if len(l:e_w) == 2 || match(l:e_w, 'E') > -1
                return ' •' . matchstr(l:e_w[0], '\d\+') .' '
            endif
        endif
    endfunction

    function! ALEGetWarning()
        let l:res = ale#statusline#Status()
        if l:res ==# 'OK'
            return ''
        else
            let l:e_w = split(l:res)
            if len(l:e_w) == 2
                return ' •' . matchstr(l:e_w[1], '\d\+')
            elseif match(l:e_w, 'W') > -1
                return ' •' . matchstr(l:e_w[0], '\d\+')
            endif
        endif
    endfunction

    let g:ale_echo_msg_error_str = '✹ Error'
    let g:ale_echo_msg_warning_str = '⚠ Warning'

    nmap <Leader>en <Plug>(ale_next)
    nmap <Leader>ep <Plug>(ale_previous)
" }

""" eof
