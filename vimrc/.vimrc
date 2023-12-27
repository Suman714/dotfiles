set number
set rnu
let mapleader = " "
set cursorline
set cursorcolumn
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set scrolloff=10
set nowrap
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set history=1000
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set updatetime=300
set signcolumn=yes
set undodir=os.getenv("HOME") .. "/.vim/undodir"
set pumheight=10

"Color------------------------------------------------------------------- {{{
colorscheme desert
highlight   LineNrAbove guifg=red term=bold
highlight   LineNr  guifg=white term=bold
highlight   LineNrBelow  guifg=green term=bold


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
"----------------------------------------------------------------------   }}}

"Plugins----------------------------------------------------------------- {{{
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tribela/vim-transparent'
call plug#end()
"------------------------------------------------------------------------ }}}

"STATUS LINE ------------------------------------------------------------ {{{

set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2

" }}}
