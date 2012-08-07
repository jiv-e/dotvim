"Move by wrapped lines gj, gk


set nocompatible

"Share clipboard with OS X
set clipboard=unnamed

"Use shift to select text in insert mode
"Makes Vim behave more like TextMate
"JIV Aiheutti ongelmia...
"if has("gui_macvim")
"    let macvim_hig_shift_movement = 1
"endif

"See :help digraph
"set nodigraph

"Pathogen plugin makes uninstalling plugins easier
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"Set font
"set gfn=Lucida_Sans_Typewriter:h18:cANSI
set guifont=Menlo\ Regular:h18
"colorscheme wombat

" Turn on omnicompletion
"colorscheme wombat
"Solarized colorscheme settings
syntax enable
set background=dark
colorscheme solarized

"Toggle solarized light/dark setting
let g:solarized_menu=0

filetype plugin on
set wildmenu
set wildmode=list:longest
"set wildmode=list:longest,full

set ofu=syntaxcomplete#Complete
highlight Pmenu ctermbg=238 gui=bold
set completeopt=longest,menuone,preview
set autowrite
set hidden
set history=1000

" CSS:n automaattinen täydennys
" au FileType css set ofu=csscomplete#CompleteCSS


" Snippetit toimimaan automaattisesti eri päätteille
au BufNewFile,BufRead *.info set filetype=info
au BufNewFile,BufRead *.module set filetype=php

" Myös HTML-snippetit php-tiedostoille
au BufNewFile,BufRead *.php set ft=php.html


"Mab leader to be , instead.view-display-id-attachment_1 of \
let mapleader = ","

"When the cursor is moved outside the viewport of the current window, the buffer is scrolled by a single line. Setting the option below will start the scrolling three lines before the border, keeping more context around where youre working.
"Typing zz is also handy; it centers the window on the cursor without moving the cursor. (But watch out for ZZ!)
set scrolloff=3

"The following will make tabs and trailing spaces visible when requested:
"By default whitespace will be hidden, but now it can be toggled with ,s.
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=500

"Show command in bottom right portion of the screen
set showcmd

"Show lines numbers
set number

"indent stuff
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set autoindent

"better line wrapping
set wrap
set textwidth=0
set wrapmargin=79
set formatoptions=qrn1

"set incremental searching"
set incsearch

"highlight searching
set hlsearch

" case insensitive search
set ignorecase
set smartcase

"enable code folding
set foldenable
"hide mouse when typing
set mousehide

" session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

"change line when moving over start or end of the line with arrow keys.
"see :help whichwrap.
set ww+=<,>

"map ¨ to $
map! <char-168> $
"map § to {
map! <char-167> {
"map ° to }
map! <char-176> }
"map å to "
map! <char-229> "

"Insertmode edits and jumps
inoremap <c-x> <bs> 
inoremap <c-bs> <c-w>
inoremap <c-d> <Right><bs>

"map code completion to ctrl + tab
imap <c-space> <c-x><c-o>

"map snipmate code completion to ctrl + tab
imap <c-tab> <c-r><tab>

"map path completion to tab
inoremap <tab> <c-x><c-f>

"faster macro repeating
nmap <space> @@

"Arpeggio commands
call arpeggio#load()
Arpeggio inoremap jk <esc>`^
Arpeggio inoremap fd <esc>`^

"shortcut for editing  vimrc file in a new tab
nmap <leader>ev :e ~/.vimrc<cr>
" snippettien muokkaaminen nopeammaksi
nmap <leader>shtml :e ~/.vim/bundle/snipmate/snippets/html.snippets<cr>
nmap <leader>sphp :e ~/.vim/bundle/snipmate/snippets/php.snippets<cr>

"prevent cursor jumping on esc
inoremap <esc> <esc>`^
inoremap <c-c> <c-c>`^

"fuzzyfinder shortcuts
nmap <del> :fufbuffer<cr> 
nmap <s-del> :fuffile<cr> 

"bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <d-k> ddkp
nmap <d-j> ddp
nmap <d-up> ddkp
nmap <d-down> ddp

"bubble multiple lines
vmap <d-k> dkp`[v`]
vmap <d-j> djp`[v`]
vmap <d-up> dkp`[v`]
vmap <d-down> djp`[v`]
nmap <c-tab> :bnext<cr>
nmap <s-tab> :bprevious<cr>

cnoremap %% <c-r>=expand('%:h').'/'<cr>
" new buffer
map <leader>ew :e %%
" new buffer with horizontal split
map <leader>es :sp %%
" new buffer with vertical split
map <leader>evs :vsp %%
" new buffer to new tab
map <leader>et :tabe %%

" source the vimrc file after saving it. this way, you don't have to reload vim to see the changes.
if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
 augroup end
endif

" easier window navigation
"nmap <c-h> <c-w>h
"nmap <c-j> <c-w>j
"nmap <c-k> <c-w>k
"nmap <c-l> <c-w>l

"helpeful abbreviations
iab lorem lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

"Spelling corrects. Just for example. Add yours below.
iab teh the
iab Teh The

" Saves file when Vim window loses focus
"au FocusLost * :wa
