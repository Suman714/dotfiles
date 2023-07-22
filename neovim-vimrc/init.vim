set number
set rnu
set mouse=a
set clipboard=unnamedplus
set smartindent
set shiftwidth=2
set tabstop=2
set splitright
syntax on
set nocompatible
filetype on
filetype plugin on
filetype indent on
set cursorline
set cursorcolumn
set laststatus=2
let mapleader = " "
set encoding=UTF-8
set hlsearch
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set laststatus=0
set undodir=os.getenv("HOME") .. "/.vim/undodir"
set pumheight=10
set guicursor=i:block

"Color------------------------------------------------------------------- {{{
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

"Lexplorer---------------------------------------------------------------- {{{
let g:netrw_keepdir = 0
let g:netrw_banner = 0
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 27
nnoremap <leader>e :Ex<CR>
"}}}
"ZenMode----------------------------------------------------------------- {{{
nnoremap <leader>. :ZenMode<CR>
"}}}

"ResizeSplits------------------------------------------------------------  {{{
nnoremap <A-h> :vertical resize -2 <CR>
nnoremap <A-l> :vertical resize +2 <CR>
nnoremap <A-j> :resize +2 <CR>
nnoremap <A-k> :resize -2 <CR>
"------------------------------------------------------------------------ }}}

"Copy/Paste-------------------------------------------------------------- {{{
nnoremap <C-a> ggmqvG"+y'q
"}}}

nnoremap <Leader>c :bd<CR>
nnoremap <S-l> :bnext<CR>
nnoremap <S-h> :bprevious<CR>
nnoremap <Leader>h :nohls<CR>
nnoremap <Leader>u :UndotreeToggle<CR>

"FZF--------------------------------------------------------------------  {{{
nnoremap <Leader>tt :vsp \| terminal<CR>
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

"}}}

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin()
	Plug 'tpope/vim-commentary'
	Plug 'ionide/Ionide-vim'
	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'folke/zen-mode.nvim'
	Plug 'tribela/vim-transparent'
	Plug 'mbbill/undotree'
	Plug 'honza/vim-snippets'
	Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
  Plug 'dense-analysis/ale'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'ryanoasis/vim-devicons'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'edkolev/tmuxline.vim'
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	Plug 'ghifarit53/tokyonight-vim'
call plug#end()

" Vim-ariline ----------------------------------------------------------- {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='tokyonight'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:tmuxline_preset = 'tmux'
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'
let g:airline_statusline_ontop = 1


" ALE """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\}

let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\}

let g:ale_fix_on_save = 1

"COC""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [ ]
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

lua <<EOF
require("indent_blankline").setup {
	char = '┊',
	show_trailing_blankline_indent = false,
}
EOF

"Vim-fugitive ---------------------------------------------------------- {{{
nnoremap <leader>gg :Git<CR>
function! WriteAndPush()
    if expand('%') == "COMMIT_EDITMSG" || expand('%:h') == "COMMIT_EDITMSG"
        :Gwrite
        :Git push
    else
        :Git push
    endif
endfunction
nnoremap <leader>gp :call WriteAndPush()<CR>
"}}}

