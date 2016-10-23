set number
set wrap
syntax on
set nocompatible
set tabstop=4
set softtabstop=4
set expandtab
set cursorline
set wildmenu
set showmatch
set relativenumber
set autowrite
colorscheme molokai
set incsearch
set smartcase
set hlsearch
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
set t_Co=256
syntax enable
filetype off
set rtp+=/usr/lib/python2.7/site-packages/powerline/bindings/vim/
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'pythoncomplete'
Plugin 'nerdtree'
call vundle#end()
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
filetype plugin indent on
func GitGrep(...)
    let save = &grepprg
    set grepprg=git\ grep\ -n\ $*
    let s = 'grep'
    for i in a:000
        let s = s . ' ' . i
    endfor
    exe s
    let &grepprg = save
endfun
command -nargs=? G call GitGrep(<f-args>)

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
