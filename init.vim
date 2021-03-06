set exrc
set secure

" ===== VIM PLUG =====
call plug#begin(stdpath('data') . '/plugged') " For Neovim: stdpath('data') . '/plugged'
Plug 'tpope/vim-fugitive'             " git integration in vim

Plug 'jiangmiao/auto-pairs'           " Automaticaly close parenthese etc...
Plug 'preservim/nerdcommenter'        " Simple shortcut to comment out lines
Plug 'ntpeters/vim-better-whitespace' " highlight bad whitespace
Plug 'godlygeek/tabular'              " Align text and tables
Plug 'tpope/vim-eunuch'               " Vim sugar for the UNIX shell commands that need it the most.

Plug 'bfrg/vim-cpp-modern'            " c++ / c syntax hhighliting
Plug 'lervag/vimtex'                  " Self explanatory
Plug 'mikelue/vim-maven-plugin'       " Maven commands from nvim
Plug 'vim-pandoc/vim-pandoc-syntax'   " Standalone pandoc syntax module, to be used alongside vim-pandoc.
Plug 'vim-pandoc/vim-pandoc'          " provide advanced integration with pandoc

Plug 'drewtempelmeyer/palenight.vim'  " Theme
Plug 'morhetz/gruvbox'                " Theme
Plug 'vim-airline/vim-airline'        " The bar at the bottom of screen

Plug 'ycm-core/YouCompleteMe'         " Autocomplete
Plug 'SirVer/ultisnips'               " Snippet engine
Plug 'honza/vim-snippets'             " Some snippets for ultisnips

Plug 'preservim/nerdtree'             " file system explorer for the Vim editor.

Plug 'dense-analysis/ale'             " Syntax highlighter
Plug 'sbdchd/neoformat'               " Format Prettymuch every file type

Plug 'davidbeckingsale/writegood.vim' " Highlight common errors in academic writing
call plug#end()
"Plug 'vimwiki/vimwiki'                       " Pretty self explanatory


" ===== WHITESPACES CONTROLS =====
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set textwidth=80
" Some python shit for indent and all
set breakindent
set list listchars=trail:·,tab:<->,eol:¬
set autoindent


" ===== NICE SHORTCUTS AND MAPPINGS =====
let mapleader = " "
" quicker way to navigates windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" git fugitiv
nmap <leader>gs :G<CR>
nmap <leader>gc :Gcommit<CR>
" YCM
nmap <leader>gt :YcmCompleter GoToDefinition<CR>
nmap <leader>gf :YcmCompleter FixIt<CR>
nmap <leader>ga :YcmCompleter Format<CR>

" ===== AESTETHIC =====
set cursorline
set colorcolumn=80
set nu rnu " display relative number on left
highlight ColorColumn ctermbg=0 guibg=lightgrey


" ===== COLORSCHEME =====
colorscheme gruvbox
let g:airline_theme = "gruvbox"
highlight Comment cterm=italic gui=italic
set termguicolors


" ===== VIMTEX / MARKOWN =====
let g:tex_flavor = "latex"
let g:vim_markdown_folding_disabled=1


" ===== MISC =====
" deactivate that annoying af shortcut
map q: <nop>
nnoremap Q <nop>
" When The buffer is not active, set the numbers to not relative
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END
" Search in those dirs when opening file under cursor
set undodir=~/.vim/undodir
set undofile
set noswapfile
set incsearch


" ===== BETTER_WHITE_SPACE =====
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:better_whitespace_ctermcolor='lightgrey'
let g:better_whitespace_guicolor='grey'


" ===== NERDTREE =====
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-t>r :NERDTreeRefreshRoot<CR>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror


" ===== VIMWIKI =====
"let g:vimwiki_list = [{
            "\ 'auto_export': 1,
            "\ 'auto_header' : 1,
            "\ 'path_html': '$HOME/wiki/html',
            "\ 'path': '$HOME/wiki/src',
            "\ 'template_path': '$HOME/wiki/templates/',
            "\ 'template_default':'GitHub',
            "\ 'template_ext':'.html5',
            "\ 'custom_wiki2html': '/home/nathan/.scripts/wiki2html.sh',
            "\ 'syntax': 'markdown',
            "\ 'ext':'.md',
            "\ 'autotags': 1,
            "\ 'list_margin': 0,
            "\ 'links_space_char' : '_',
            "\}]
"let g:vimwiki_hl_headers = 0
"let g:vimwiki_ext2syntax = {'.md': 'markdown'}


" ===== NEOFORMAT =====
"let g:neoformat_ocaml_ocamlformat = {
            "\ 'exe': 'ocamlformat',
            "\ 'no_append': 1,
            "\ 'stdin': 1,
            "\ 'args': ['--disable-outside-detected-project', '--name', '"%:p"', '-']
            "\ }

"let g:neoformat_enabled_ocaml = ['ocamlformat']

"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"
"
" ===== CLANG FORMATING =====
"map <C-a> :pyf /usr/share/clang/clang-format.py<cr>
"imap <C-k> <c-o>:pyf /usr/share/clang/clang-format.py<cr>
"function! Formatonsave()
  "let l:formatdiff = 1
  "pyf /usr/share/clang/clang-format.py
"endfunction
"autocmd BufWritePre *.hh,*.hxx,*.h,*.cc,*.cpp,*.c call Formatonsave()
 "Restore cursor position, window position, and last search after running a
 "command.
