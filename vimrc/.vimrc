set number
set rnu
let mapleader = " "
set cursorline
set cursorcolumn
" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

"Color------------------------------------------------------------------- {{{
colorscheme habamax

"Lexplorer---------------------------------------------------------------- {{{
let g:netrw_keepdir = 0
let g:netrw_banner = 0
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 27
nnoremap <Leader>e :Ex <CR>
"}}}

"ResizeSplits------------------------------------------------------------  {{{
execute "set <M-h>=\eh"
nnoremap <M-h> :vertical resize -2 <CR>
execute "set <M-l>=\el"
nnoremap <M-l> :vertical resize +2 <CR>
execute "set <M-j>=\ej"
nnoremap <M-j> :resize +2 <CR>
execute "set <M-k>=\ek"
nnoremap <M-k> :resize -2 <CR>

"------------------------------------------------------------------------ }}}

nnoremap <Leader>tt :vertical terminal<CR>
nnoremap <Leader>c :bd<CR>
nnoremap <Leader>h :nohls<CR>
nnoremap <S-l> :bnext<CR>
nnoremap <S-h> :bprevious<CR>

"FZF--------------------------------------------------------------------  {{{
nnoremap <silent> <Leader>sb :Buffers<CR>
nnoremap <silent> <Leader>sf :Files<CR>
nnoremap <silent> <Leader>sg :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>


"Plugins----------------------------------------------------------------- {{{
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tribela/vim-transparent'
call plug#end()
"------------------------------------------------------------------------ }}}

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}
