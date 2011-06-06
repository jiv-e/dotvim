set nocompatible

set diffexpr=MyDiff()

"Pathogen plugin makes uninstalling plugins easier
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"Set font
"set gfn=Lucida_Sans_Typewriter:h18:cANSI
set guifont=Menlo\ Regular:h18
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

" Snippetit toimimaan automaattisesti eri päätteille
au BufNewFile,BufRead *.info set filetype=info
au BufNewFile,BufRead *.module set filetype=php

"Mab leader to be , instead of \
let mapleader = ","

"When the cursor is moved outside the viewport of the current window, the buffer is scrolled by a single line. Setting the option below will start the scrolling three lines before the border, keeping more context around where you’re working.
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

"Indent stuff
set smartindent
set autoindent

"Better line wrapping
set wrap
set textwidth=79
set formatoptions=qrn1

"Set incremental searching"
set incsearch

"Highlight searching
set hlsearch

" case insensitive search
set ignorecase
set smartcase

"Enable code folding
set foldenable

"Hide mouse when typing
set mousehide

" session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

"Change line when moving over start or end of the line with arrow keys.
"See :help whichwrap.
set ww+=<,>

"Map code completion to , + tab
imap <leader><space> <C-x><C-o>

"Map snipMate code completion to , + tab
imap <leader><tab> <C-r><tab>

"Shortcut for editing  vimrc file in a new tab
nmap <leader>ev :e ~/.vimrc<cr>

"Map escape key to jj -- much faster
imap jj <esc>

"Fuzzyfinder shortcuts
nmap <Del> :FufBuffer<CR> 
nmap <S-Del> :FufFile<CR> 

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp

"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

nmap <C-Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>



" Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.
if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
 augroup END
endif

" easier window navigation
"nmap <C-h> <C-w>h
"nmap <C-j> <C-w>j
"nmap <C-k> <C-w>k
"nmap <C-l> <C-w>l

"Helpeful abbreviations
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

"Spelling corrects. Just for example. Add yours below.
iab teh the
iab Teh The

" Saves file when Vim window loses focus
au FocusLost * :wa


