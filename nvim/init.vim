call plug#begin('~/.local/share/nvim/plugged')

Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree' |
	    \ Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'psliwka/vim-smoothie'
Plug 'joshdick/onedark.vim'
Plug 'ap/vim-css-color'

call plug#end()

"if (has("autocmd") && !has("gui_running"))
"  augroup colorset
"    autocmd!
"    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
"    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
"  augroup END
"endif

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set updatetime=100

set shell=zsh

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '✖'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '✖'

set mouse=a
set number
set relativenumber
set cursorline
syntax on
filetype plugin indent on

let g:startify_custom_header = [
	\'		   01001101 01001001 01010100 01000101 01001110' 
	\]

augroup nerdtreehidecwd
  autocmd!
  autocmd FileType nerdtree setlocal conceallevel=3
          \ | syntax match NERDTreeHideCWD #^[</].*$# conceal
          \ | setlocal concealcursor=n
augroup end
let g:NERDTreeWinSize=25
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <C-p> :bp<CR>
nnoremap <C-n> :bn<CR>

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_theme='onedark'

let g:onedark_hide_endofbuffer=1
let g:onedark_termcolor=256
let g:onedark_terminal_italics=1
let g:onedark_color_overrides = {
\ "black": {"gui": "#121212", "cterm": "233" },
\ "cursor_grey": {"gui": "#1c1c1c", "cterm": "234" },
\ "menu_grey": {"gui": "#1c1c1c", "cterm": "234" }
\}
colorscheme onedark

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

source $HOME/.config/nvim/coc.vim
