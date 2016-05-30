" DBCerigo vimrc file

" ## MAPPINGS ##
" ### Mapped Space to be my 'leader key' ##### 
" which means it begins a key combo input sequence
let mapleader="\<Space>"
" On 'nnoremap' see http://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
" !!! Watch out for trailing white space !!!

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
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
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
" Hiding files matching in explorer 
" grabs regex from gitignore files that it can find also
let g:netrw_list_hide= '.*\.swp$,.*\.sw?$'    " netrw_gitignore#Hide() . !! this seems to be fucking up
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
" Map cmd j to ctr-N for start auto and choose down
inoremap <D-j> <C-N>
" Map cmd k to ctr-P for start auto
inoremap <D-k> <C-P>
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
" colouring and look of files
set background=dark
" don't use in terminal? not sure should figure...
let g:solarized_termcolors=256
colorscheme solarized 
" Turn on highlighting search
" Use ':noh' to kill last search
set hlsearch
" Turn on line numbers
set number
" Show tab markers TODo?

" ### Writing help ### 
"filetype plugin on
"set omnifunc=syntaxcomplete#Complete
" Spell checking
set spell spelllang=en_us
" Faster load for files larger than 10mb but they not editable 
let g:LargeFile=10

" ### Bundle ### !!! Keep this shit to a minimum !!!
" VUMBLE: vim bundle package manager
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
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'scrooloose/syntastic'
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

" ## A Bundle Manager for some shit ##
" Probably need it for the solarized install, should figure...
" using Pathogen to autoload plugins
call pathogen#infect()
syntax on
"filetype plugin indent on !!! think this actually disables the plugin jams
syntax enable


" ### Tagging ###
" does something with the tagging system, which I don't yet use so
"set tags=./tags;/
