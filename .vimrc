
" turn filetype detection off and, even if it's not strictly
" necessary, disable loading of indent scripts and filetype plugins
filetype off
filetype plugin indent off

" pathogen runntime injection and help indexing
call pathogen#infect()
call pathogen#helptags()

" turn filetype detection, indent scripts and filetype plugins on
" and syntax highlighting too
filetype plugin indent on
filetype on
syntax on

" Project specific vimrc
set exrc
set secure
set background=dark

let mapleader = "\<Space>"

set spell

" Line Numbering
set number

" Show cursor's column and line number
set ruler

" Make the cursor highlight the whole line
" set cursorline

set incsearch

" Ignore case if all in lower case
set smartcase

" Highlight all search matches
set hlsearch

" Hide buffers when they are abandonded instead of unloading
set hidden

" Jedi customizations
let jedi#use_tabs_not_buffers=0

" Leader + number to change to that window
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

" Keep swap files centrally to stop polluting code dirs
set directory=$HOME/.vim/swap/

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_python_pylint_post_args="--max-line-length=120"
let g:syntastic_python_flake8_args='--ignore=E501'

let g:syntastic_rst_checkers = ["sphinx"]

let g:rst_fold_enabled = 1

" vim-airline
set laststatus=2 " Show status immediately
let g:airline_section_warning=""
let g:airline_section_y=""

" ArcherDX
set path=~/src/**

" vimwiki

let g:vimwiki_list = [{'path': '~/OmniPresence/vimwiki/', 'path_html': '~/OmniPresence/vimwiki_html/'}]

" Ultisnips
let g:python3_host_prog = '/usr/local/bin/python3'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"


" ALE Fixers
let g:ale_fixers = {'python': ['autopep8', 'isort'], 'json': ['fixjson']}
let g:ale_c_cc_options = "-std=c99 -Wall -I/usr/local/include"

" FZF
set rtp+=/usr/local/opt/fzf
nnoremap <leader>f :FZF<CR>
nnoremap <leader>b :Buffers<CR>

" Ack/ag
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack


" persistent undo
set undodir=~/.vim/undodir/
set undofile
