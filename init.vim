set exrc
set secure

" ===== VIM PLUG =====
call plug#begin(stdpath('data') . '/plugged') " For Neovim: stdpath('data') . '/plugged'
Plug 'tpope/vim-fugitive' " git integration on vim
Plug 'kovetskiy/sxhkd-vim' "Syntax highliting and indent for sxhd config file (the file used for keymaps)
Plug 'romainl/vim-qf' " Open the quickfix window when needed
Plug 'jiangmiao/auto-pairs' " Automaticaly close parenthese etc...
Plug 'JuliaEditorSupport/julia-vim' " Julia support for Vim
Plug 'bfrg/vim-cpp-modern' " c++ / c syntax hhighliting
Plug 'l04m33/vlime', {'rtp': 'vim/'} " environment for lisp
Plug 'preservim/nerdcommenter' " Simple shortcut to comment out lines
Plug 'drewtempelmeyer/palenight.vim' " Theme
Plug 'vim-airline/vim-airline' " The bar at the bottom of screen
Plug 'ntpeters/vim-better-whitespace' " highlight bad whitespace
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' } " A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'vimwiki/vimwiki' " Pretty self explanatory
call plug#end()


" ===== WHITESPACES CONTROLS =====
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set textwidth=80
" Some python shit for indent and all
set breakindent
set list listchars=trail:·,tab:<->,eol:¬


" ===== NICE SHORTCUTS =====
" quicker way to change window
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h


" ===== AESTETHIC =====
set cursorline


" ===== VIMWIKI =====
let g:vimwiki_list = [{
            \ 'auto_export': 1,
            \ 'auto_header' : 1,
            \ 'path_html': '$HOME/wiki/html',
            \ 'path': '$HOME/wiki/src',
            \ 'template_path': '$HOME/wiki/templates/',
            \ 'template_default':'GitHub',
            \ 'template_ext':'.html5',
            \ 'syntax': 'markdown',
            \ 'ext':'.md',
            \ 'custom_wiki2html': '/home/nathan/.scripts/wiki2html.sh',
            \ 'autotags': 1,
            \ 'list_margin': 0,
            \ 'links_space_char' : '_',
            \}]
let g:vimwiki_hl_headers = 1
let g:vimwiki_ext2syntax = {'.md': 'markdown'}


" ===== COLORSCHEME =====
set background=dark
colorscheme palenight
let g:airline_theme = "palenight"
highlight Comment cterm=italic gui=italic
let g:palenight_terminal_italics=1
set termguicolors


" ===== LATEX PREVIEW =====
let g:livepreview_previewer = 'zathura'
let g:tex_flavor="latex"


" ===== VLIME =====
set runtimepath^=/home/nathan/.local/share/nvim/plugged/vlime/vim


" ===== MISC =====
set nu rnu " display relative number on left
" deactivate that annoying af shortcut
map q: <nop>
nnoremap Q <nop>

"
" ===== BETTER_WHITE_SPACE =====
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1


" ===== CLANG FORMATING =====
map <C-a> :pyf /usr/share/clang/clang-format.py<cr>
imap <C-k> <c-o>:pyf /usr/share/clang/clang-format.py<cr>
function! Formatonsave()
  let l:formatdiff = 1
  pyf /usr/share/clang/clang-format.py
endfunction
"autocmd BufWritePre *.h,*.cc,*.cpp,*.c call Formatonsave()

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END
