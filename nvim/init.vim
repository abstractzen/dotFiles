"Set plugin directory for vim-plug:
"	Specify a directory for plugins
" 	- For Neovim: stdpath('data') . '/plugged'
" 	- Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data').'/plugged')

"LaTeX Stuff
Plug 'lervag/vimtex' , { 'for':'tex'}
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_progname='nvr'
let g:vimtex_fold_enabled = 1 "Folding
autocmd BufNewFile *.tex 0read ~/.config/nvim/templates/skeleton.tex  "tex template

"Nertree
"Plug 'preservim/nerdtree'

""Snippets
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwadTrigger = '<tab>'
let g:UltiSnipsEditSplit="vertical"

""Live Preview
Plug 'xuhdev/vim-latex-live-preview' ", { 'for': 'tex' }
autocmd Filetype tex setl updatetime=1000 " setting update interval
let g:livepreview_previewer = 'open -a Skim' "use Skim

"Theming
set cursorline
Plug 'victorze/foo'
syntax enable
set number
set background=dark
set showmatch "Show matching braces
autocmd BufWritePre *.tex %s/\s\+$//e "automatically remove white spaces on save (only on .tex files)
set statusline+=%F "display filepath in status bar
Plug 'joshdick/onedark.vim' "OneDark Theme
Plug 'sheerun/vim-polyglot' "Syntax Highlighting
""lightline
"Plug 'itchyny/lightline.vim'

""Startup screen
Plug 'mhinz/vim-startify'

""Boilerplate
"Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc
call NumberToggle()
"autosave
set autowrite

"Folding
"set foldmethod=syntax
"Plug 'matze/vim-tex-fold'
Plug 'konfekt/fastfold'
let g:tex_fold_enabled =1

"Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_powerline_fonts = 1

"Git integration
"Plug 'tpope/vim-fugitive'

"Completion via deoplete
Plug 'shougo/deoplete.nvim'
let g:deoplete#enable_at_startup=1 "Use Deoplete

"More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.


" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Initialize plugin system
call plug#end()
let g:airline_theme =   'onedark' " 'xtermlight'
syntax on
colorscheme onedark "hyper
"let g:lightline = { 'colorscheme':'onedark'}
""Use deoplete with vimtex
call deoplete#custom#var ('omni', 'input_patterns', { 'tex': g:vimtex#re#deoplete, 'r': '[^. *\t]\.\w*', })
"autocmd BufReadPost,BufNewFile *.tex :LLPStartPreview<CR>  "Autostart Live preview on first write to tex file
"autocmd BufEnter,BufNewFile *.tex :VimtexCompile<CR> "Autostart Live preview on first write to tex file

"augroup vimtex_config
"	autocmd User VimtexEventInitPost VimtexCompile
"augroup END

"Auto closing brackets
"inoremap {<CR> {<CR>}<Esc>ko<tab>
"inoremap (<CR> (<CR>)<Esc>ko<tab>
