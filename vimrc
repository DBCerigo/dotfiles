" DBCerigo vimrc file

" TODO:
" 1. Clean up/simplify package mangers (Vundle/Pathogen)
" 2. Add if OS switch so optimised for using on server and local

" Requirements
" 1. Install https://github.com/VundleVim/Vundle.vim then [:PluginInstall] in vim
" 2. Install Pathogen https://github.com/tpope/vim-pathogen
" 3. Install Solarized http://ethanschoonover.com/solarized/vim-colors-solarized

" ## MAPPINGS ##
" ### Mapped Space to be my 'leader key' #####
" which means it begins a key combo input sequence
let mapleader="\<Space>"
" On 'nnoremap' see http://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
" !!! Watch out for trailing white space !!!

" # force autoreload on changes to file on disk (nice)
set autoread

" ##### Paning #####
" ## File nav and control ##
" Map <space-e> to open explorer on left pane
nnoremap <leader>e :call MakeEx(25)<cr>
" Map <space-w> to be write changes
nnoremap <leader>w :w<cr>
" Map <space-q> to be quit
nnoremap <leader>q :q<cr>
" Map <space-a> to be write changes and quit
nnoremap <leader>x :x<cr>
" Remove that such fucking annoying popup window ting
map q: :q
" Map <space> movments to changing panes
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>
" Resizing short cuts
nnoremap <silent> <leader>f :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <leader>d :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
" ### Explore configs ###
" Make new panes open below and right, instead of above and left
set splitbelow
set splitright
" no banner
let g:netrw_banner=0
" Hiding files matching in explorer - NOTE: 'a' to toggle hiding
" grabs regex from gitignore files that it can find also
let g:netrw_list_hide= '.*\.swp$,.*\.sw?$,.*\.pyc,.*\.retry,^\.[^\.]'    " netrw_gitignore#Hide() . !! this seems to be fucking up
" # Normalises widths # of open buffers - except if one has been fixed
fun! NormalizeWidths()
    let eadir_pref = &eadirection
    set eadirection=hor
    set equalalways! equalalways!
    let &eadirection = eadir_pref
endf
" # Autocalls normalize when using 'v' from netrw
augroup NetrwGroup
    autocmd! BufEnter * call NormalizeWidths()
augroup END
" ### Make Explore Smart ###
fun! MakeEx(vex_width)
    if exists("t:netrw_lexbufnr")
        execute "Lexplore"
        call NormalizeWidths()
    else
        execute "Lexplore"
        execute "vertical resize" . a:vex_width
        set winfixwidth
        call NormalizeWidths()
    endif
endf

" ### Text Wrangling ###
" ## Auto complete ##
" Map atl j to ctr-N for start auto and choose down
inoremap <A-j> <C-N>
" Map atl k to ctr-P for start auto
inoremap <A-k> <C-P>
" Auto complete configuration
set completeopt=longest,menuone
" ## Bubbling text ##
" Bubble single lines - in normal mode
nnoremap <C-k> ddkP
nnoremap <C-j> ddp
" Bubble multiple lines - in visual mode - the `[ are mark movements
vnoremap <C-k> xkP`[V`]
vnoremap <C-j> xp`[V`]
" ## Tabbing and white space ##
" expand tabs to be series of spaces
set expandtab
" Set the number of spaces per tab
set tabstop=4
" Set the number of spaces per indent to be four spaces
set shiftwidth=4
" ## Fix Backspace ##
" In insert mode, to allow the backspace key to erase previously entered characters, autoindent, and newlines,
set bs=indent,eol,start
" ## vp doesn't replace paste buffer FRESH
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" ### Looks ###
" ## Line length marker ##
"   set column highlighting color
highlight ColorColumn ctermbg=237 guibg=#2c2d27
"   set column to be highlighted if Python file
autocmd FileType python let &colorcolumn="101"
" ## A Bundle Manager for some shit ##
" Probably need it for the solarized install, should figure...
" using Pathogen to autoload plugins
call pathogen#infect()
syntax on
"filetype plugin indent on !!! think this actually disables the plugin jams
syntax enable
" colouring and look of files
set background=dark
" don't use in terminal? not sure should figure...
let g:solarized_termcolors=256
colorscheme solarized
" Turn on highlighting search
" Use ':noh' to kill last search
set hlsearch
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" Turn on line numbers
set number

" ### Folding ###
" Set fold style to indent
set foldmethod=indent
" Set nothing over default of #
set foldignore=
" # Mappings #
" toggle folding off/on
nnoremap <leader>i zi
" move between folds
nnoremap <leader>j zj
nnoremap <leader>k zk
" 'open' fold all the way
nnoremap <leader>a zA
" zX undos all manually opened and closed folds - reset all back to set level
" use for closing folds
nnoremap <leader>z zX
" use to set if wanting to fold classes, or fold function, etc.
nnoremap <leader>r zr
nnoremap <leader>m zm
" Show tab markers TODO? nah

" ### Writing help ###
"filetype plugin on
"set omnifunc=syntaxcomplete#Complete
" Spell checking
set spell
set spelllang=en_gb
set spellfile=$HOME/.vim-spell-en.utf-8.add
hi clear SpellBad
hi SpellBad cterm=underline
hi clear SpellRare
hi SpellRare cterm=underline
hi clear SpellCap
hi SpellCap cterm=underline
hi clear SpellLocal
hi SpellLocal cterm=underline
inoremap <C-n> <c-g>u<Esc>[s1z=`]a<c-g>u
noremap <C-n> [s1z=`]
" Faster load for files larger than 10mb but they not editable
let g:LargeFile=10


" ### Bundle ### !!! Keep this shit to a minimum !!!
" vundle: vim bundle package manager
set nocompatible              " required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Add all your plugins HERE
" Plugin 'Valloric/YouCompleteMe'
"   Can't get you complete me to work...
" Adds the status bar (including git branch etc.) at bottom of window
Plugin 'powerline/powerline'
" Syntax checking - could be useful if wanna get really anal - off for now
"Plugin 'scrooloose/syntastic'
" Disable (set to must toggle) it for now - and must use autocmd as plugin not
" loaded until then.
"autocmd VimEnter * SyntasticToggleMode
Plugin 'ctrlpvim/ctrlp.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ### Tagging ###
" does something with the tagging system, which I don't yet use so
"set tags=./tags;/
"
" ### ctrlp ###
let g:ctrlp_user_command = [
    \ '.git', 'cd %s && git ls-files . -co --exclude-standard',
    \ 'find %s -type f'
    \ ]

