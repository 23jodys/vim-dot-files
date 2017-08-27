
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

let g:github_access_token = "ffc594f1ea30e3e29d39c25bc05cf7ea386c92fa"
let g:github_upstream_issues = 1

" vim-airline
set laststatus=2 " Show status immediately
let g:airline_section_warning=""
let g:airline_section_y=""

" ArcherDX
set path=~/src/**

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

" Grade/Syntastic
let g:syntastic_java_checkers=['javac']
let g:syntastic_java_javac_config_file_enabled = 1

" Javacomplete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
set completeopt=longest,menuone
