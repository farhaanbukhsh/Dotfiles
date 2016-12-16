set number
set wrap
set tw=79
syntax on
set nocompatible

" Because real programmers use TAB but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

set expandtab
set cursorline
set wildmenu
set showmatch

"Show relative numbers
set relativenumber
set autowrite

" Show whitespace
" " MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
colorscheme molokai

" Search feature for the editor
set incsearch
set smartcase
set hlsearch

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Powerline setup for vim
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
set t_Co=256
syntax enable
filetype off
set rtp+=/usr/lib/python2.7/site-packages/powerline/bindings/vim/
set rtp+=~/.vim/bundle/Vundle.vim

" Rebind <Leader> key
" " I like to have it here becuase it is easier to reach than the default and
" " it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'nerdtree'
Plugin 'tmhedberg/SimpylFold'
Bundle 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
call vundle#end()

"" NERDTree configuration
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
filetype plugin indent on


"Removes trailing spaces
 function! TrimWhiteSpace()
     %s/\s\+$//e
     endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>
autocmd FileType python,java autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileType python,java autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FileType python,java autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd FileType python,java autocmd BufWritePre     * :call TrimWhiteSpace()

:imap jj <Esc>

" Better copy & paste
 " When you want to paste large blocks of code into vim, press F2 before you
 " paste. At the bottom you should see ``-- INSERT (paste) --``.

 set pastetoggle=<F2>
 set clipboard=unnamed

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
 map <c-j> <c-w>j
 map <c-k> <c-w>k
 map <c-l> <c-w>l
 map <c-h> <c-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Shift-<Arrow Key> with selection moves a block without selection moves a
" particular line
nnoremap <S-Down> :m .+1<CR>==
nnoremap <S-Up> :m .-2<CR>==
inoremap <S-Down> <Esc>:m .+1<CR>==gi
inoremap <S-Up> <Esc>:m .-2<CR>==gi
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv

" Enable folding
 set foldmethod=indent
 set foldlevel=99

 " Enable folding with the spacebar
 nnoremap <space> za

 " For YouCompleteME
 let g:ycm_autoclose_preview_window_after_completion=1
 map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

 " Bind nohl
 " Removes highlight of your last search
 " ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
 noremap <C-n> :nohl<CR>
 vnoremap <C-n> :nohl<CR>
 inoremap <C-n> :nohl<CR>

 " Quicksave command
 noremap <C-Z> :update<CR>
 vnoremap <C-Z> <C-C>:update<CR>
 inoremap <C-Z> <C-O>:update<CR>

 " Quick quit command
 noremap <Leader>e :quit<CR>  " Quit current window
 noremap <Leader>E :qa!<CR>   " Quit all windows
