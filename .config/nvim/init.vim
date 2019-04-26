"    _                                  __     ___           ____   ____
"   / \__      _____  ___  _ __ ___   __\ \   / (_)_ __ ___ |  _ \ / ___|
"  / _ \ \ /\ / / __|/ _ \| '_ ` _ \ / _ \ \ / /| | '_ ` _ \| |_) | |
" / ___ \ V  V /\__ \ (_) | | | | | |  __/\ V / | | | | | | |  _ <| |___
"/_/   \_\_/\_/ |___/\___/|_| |_| |_|\___| \_/  |_|_| |_| |_|_| \_\\____|


"  _____                    _   _       _
" | ____|___ ___  ___ _ __ | |_(_) __ _| |___
" |  _| / __/ __|/ _ \ '_ \| __| |/ _` | / __|
" | |___\__ \__ \  __/ | | | |_| | (_| | \__ \
" |_____|___/___/\___|_| |_|\__|_|\__,_|_|___/

let mapleader="," "Leader is comma
" check whichTMUX session I am in
let TMUX_ENV = trim(system('tmux display-message -p ''#S''  '))

nnoremap <leader>ev :split $MYVIMRC<cr> ",ev opens .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr> ",sv sources .vimrc
nnoremap <leader>et :split ~/.tmux.conf<cr> ",et opens .tmux.conf
nnoremap <leader>st :! tmux source-file ~/.tmux.conf<cr> ",st sources .tmux.conf
nnoremap <leader>ez :split ~/.zshrc<cr> ",ez opens .zshrc
nnoremap <leader>sz :!source ~/.zshrc<cr> ",ez sources .zshrc
nnoremap <leader>ea :split ~/.aliases<cr> ",ea opens .aliases
nnoremap <leader>sa :!source ~/.aliases<cr> ",ea sources .aliases
setlocal spell spelllang=en_gb "language
set nocompatible " Good practice
set nospell

"  ____  _             _
" |  _ \| |_   _  __ _(_)_ __
" | |_) | | | | |/ _` | | '_ \
" |  __/| | |_| | (_| | | | | |
" |_|   |_|\__,_|\__, |_|_| |_|
"                |___/
"                                                              _
"  _ __ ___   __ _ _ __   __ _  __ _  ___ _ __ ___   ___ _ __ | |_
" | '_ ` _ \ / _` | '_ \ / _` |/ _` |/ _ \ '_ ` _ \ / _ \ '_ \| __|
" | | | | | | (_| | | | | (_| | (_| |  __/ | | | | |  __/ | | | |_
" |_| |_| |_|\__,_|_| |_|\__,_|\__, |\___|_| |_| |_|\___|_| |_|\__|
"                              |___/
"pathogen package manager
execute pathogen#infect()
filetype off "off for setting up plugins - turned back on later
let g:ale_emit_conflict_warnings = 0 " turned off warnings in ALE -- Why?

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

"set mouse=a

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-dotenv'
Plugin 'tpope/vim-dadbod'
Plugin 'prettier/vim-prettier'
Plugin 'scrooloose/nerdtree'
Plugin 'vimwiki/vimwiki'
if TMUX_ENV == 'base'
    Plugin 'suan/vim-instant-markdown'
endif
Plugin 'w0rp/ale'
Plugin 'tmhedberg/SimpylFold'
Plugin 'SirVer/ultisnips'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mhinz/vim-signify'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'Townk/vim-autoclose'
Plugin 'benmills/vimux'
Plugin 'flazz/vim-colorschemes'
Plugin 'easymotion/vim-easymotion'
Plugin 'ryanoasis/vim-devicons'
Plugin 'fatih/vim-go'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'mattn/emmet-vim'

call vundle#end()
filetype plugin indent on

"     _
"    / \   _ __  _ __   ___  __ _ _ __ __ _ _ __   ___ ___
"   / _ \ | '_ \| '_ \ / _ \/ _` | '__/ _` | '_ \ / __/ _ \
"  / ___ \| |_) | |_) |  __/ (_| | | | (_| | | | | (_|  __/
" /_/   \_\ .__/| .__/ \___|\__,_|_|  \__,_|_| |_|\___\___|
"         |_|   |_|
"
" Font + Fundementals
set guifont=DroidSansMono\ Nerd\ Font\ 14
set t_Co=256
set laststatus=2
set noswapfile
syntax on

if TMUX_ENV == 'base'
    colorscheme deepsea
else
    colorscheme bubblegum-256-light
endif


highlight colorcolumn ctermbg=0
set softtabstop=4 shiftwidth=4 expandtab
set noshowmode
set textwidth=80
set colorcolumn=81



" Numbers / Gutter
set number
set relativenumber

"Set go tags up"
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" Airline & StatusLine
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_ep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline#extensions#tabline#enabled = 1
if TMUX_ENV == 'base'
    let g:airline_theme='badwolf'
else
    let g:airline_theme='atomic'
endif
set statusline+=%#warningmsg#
set statusline+=%{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''}
set statusline+=%*


"     _         _         ____                      _      _   _
"    / \  _   _| |_ ___  / ___|___  _ __ ___  _ __ | | ___| |_(_) ___  _ __
"   / _ \| | | | __/ _ \| |   / _ \| '_ ` _ \| '_ \| |/ _ \ __| |/ _ \| '_ \
"  / ___ \ |_| | || (_) | |__| (_) | | | | | | |_) | |  __/ |_| | (_) | | | |
" /_/   \_\__,_|\__\___/ \____\___/|_| |_| |_| .__/|_|\___|\__|_|\___/|_| |_|
"                                            |_|

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

" Set up neovim auto completion"
" let g:neocomplete#enable_at_startup = 1

" ALE stuff
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '!'
let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_linters = {'jsx': ['prettier']}
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript':['eslint','prettier'],
\   'go':['gofmt'],
\   'python':['autopep8'],
\   'make':['checkmake'],
\   'dockerfie':['dockerfile_lint'],
\}
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
" Enable completion where available.
" This setting must be set before ALE is loaded.

let g:ale_completion_enabled = 1
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim


augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

" Use deoplete.
let g:deoplete#enable_at_startup = 1

"  __  __                                     _
" |  \/  | _____   _____ _ __ ___   ___ _ __ | |_ ___
" | |\/| |/ _ \ \ / / _ \ '_ ` _ \ / _ \ '_ \| __/ __|
" | |  | | (_) \ V /  __/ | | | | |  __/ | | | |_\__ \
" |_|  |_|\___/ \_/ \___|_| |_| |_|\___|_| |_|\__|___/


" move to next html tag with %
runtime macros/matchit.vim
" VIMmotion

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to wormap  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"  _____     _     _ _
" |  ___|__ | | __| (_)_ __   __ _
" | |_ / _ \| |/ _` | | '_ \ / _` |
" |  _| (_) | | (_| | | | | | (_| |
" |_|  \___/|_|\__,_|_|_| |_|\__, |
"                            |___/

nnoremap <space> za
set foldmethod=indent
set foldlevel=99
let g:SimplyFold_docstring_preview=1


"  _   _             _             _   _
" | \ | | __ ___   _(_) __ _  __ _| |_(_) ___  _ __
" |  \| |/ _` \ \ / / |/ _` |/ _` | __| |/ _ \| '_ \
" | |\  | (_| |\ V /| | (_| | (_| | |_| | (_) | | | |
" |_| \_|\__,_| \_/ |_|\__, |\__,_|\__|_|\___/|_| |_|
"                      |___/

nnoremap <leader>q :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeWinPos = "right"

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

"  ____                                                _
" |  _ \ _ __ ___   __ _ _ __ __ _ _ __ ___  _ __ ___ (_)_ __   __ _
" | |_) | '__/ _ \ / _` | '__/ _` | '_ ` _ \| '_ ` _ \| | '_ \ / _` |
" |  __/| | | (_) | (_| | | | (_| | | | | | | | | | | | | | | | (_| |
" |_|   |_|  \___/ \__, |_|  \__,_|_| |_| |_|_| |_| |_|_|_| |_|\__, |
"                  |___/                                       |___/
"
" GOLANG------------
"
" Don't try to autoinstall go by default
let g:go_disable_autoinstall = 1
let g:go_highlight_types = 1

" Highlight
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1
"
" Trigger configuration.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"  __  __                   _
" |  \/  | __ _ _ __  _ __ (_)_ __   __ _ ___
" | |\/| |/ _` | '_ \| '_ \| | '_ \ / _` / __|
" | |  | | (_| | |_) | |_) | | | | | (_| \__ \
" |_|  |_|\__,_| .__/| .__/|_|_| |_|\__, |___/
"              |_|   |_|            |___/
"

" No Arrows for you normal mode!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" insert mode ctrl + ? to mimic normal functions
imap <C-d> <esc>ddi
imap <C-p> <esc>pi
imap <C-y> <esc>yi
" ," and ,' to "quote" a 'word'
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" Window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"  ____                      _     _
" / ___|  ___  __ _ _ __ ___| |__ (_)_ __   __ _
" \___ \ / _ \/ _` | '__/ __| '_ \| | '_ \ / _` |
"  ___) |  __/ (_| | | | (__| | | | | | | | (_| |
" |____/ \___|\__,_|_|  \___|_| |_|_|_| |_|\__, |
"                                          |___/
set hlsearch
set incsearch

" This unsets the 'last search pattern' register by hitting ;
nnoremap <leader>? :noh<CR>:<backspace>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

"  ____  _                                             _
" |  _ \| | __ _ _   _  __ _ _ __ ___  _   _ _ __   __| |
" | |_) | |/ _` | | | |/ _` | '__/ _ \| | | | '_ \ / _` |
" |  __/| | (_| | |_| | (_| | | | (_) | |_| | | | | (_| |
" |_|   |_|\__,_|\__, |\__, |_|  \___/ \__,_|_| |_|\__,_|
"                |___/ |___/
"
"                Try new stuff out here

" Trying to break bad habits  for motion commands
nnoremap ww <nop>
nnoremap ee <nop>
nnoremap bb <nop>
"nnoremap jj <nop>
"nnoremap kk <nop>
nnoremap ll <nop>

" Control + A will run the sum under cursor
ino <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

" m + a number will reorder lines in a text block!
function! MoveEm(position)
    let saved_cursor = getpos(".")
    let previous_blank_line = search('^$', 'bn')
    let target_line = previous_blank_line + a:position -1
    execute 'move '  . target_line
    call setpos('.',saved_cursor)
endfunction

for position in range(1,9)
    execute 'nnoremap m' . position . ' :call MoveEm(' . position .')<cr>'
endfor

" ,fg will ask you for a word to enter at current cursor in figlet text
nnoremap <leader>fg :execute 'r!figlet "'.input('Enter message: ').'"'<cr>


let g:instant_markdown_autostart = 1 "if doing a lot of MD - https://github.com/suan/vim-instant-markdown
"  __  __ _
" |  \/  (_)___  ___
" | |\/| | / __|/ __|
" | |  | | \__ \ (__ _
" |_|  |_|_|___/\___(_)
"
"  A grave yard of cammands no longer needed or wanted but worth keeping in limbo for now

" let g:instant_markdown_autostart = 1 "if doing a lot of MD - https://github.com/suan/vim-instant-markdown
"let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_server_python_interpreter = '/usr/bin/python2'
"if has ("autocmd")
"   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
"endif
