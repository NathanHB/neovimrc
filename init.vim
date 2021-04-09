set exrc
set secure

" ===== VIM PLUG =====
call plug#begin(stdpath('data') . '/plugged')  " For Neovim: stdpath('data') . '/plugged'
Plug 'tpope/vim-fugitive'                      " git integration in vim
Plug 'jiangmiao/auto-pairs'                    " Automaticaly close parenthese etc...
Plug 'bfrg/vim-cpp-modern'                     " c++ / c syntax hhighliting
Plug 'preservim/nerdcommenter'                 " Simple shortcut to comment out lines
Plug 'drewtempelmeyer/palenight.vim'           " Theme
Plug 'vim-airline/vim-airline'                 " The bar at the bottom of screen
Plug 'ntpeters/vim-better-whitespace'          " highlight bad whitespace
Plug 'ycm-core/YouCompleteMe'                  " Autocomplete
Plug 'SirVer/ultisnips'                        " Snippet engine
Plug 'honza/vim-snippets'                      " Some snippets for ultisnips
Plug 'lervag/vimtex'                           " Self explanatory
Plug 'preservim/nerdtree'                      " NerdTree
Plug 'godlygeek/tabular'                       " Align text and tables
Plug 'mikelue/vim-maven-plugin'                " Maven commands from nvim
"Plug 'dense-analysis/ale'                      " Syntax highlighter
"Plug 'sbdchd/neoformat'                        " Format Prettymuch every file type
"Plug 'kovetskiy/sxhkd-vim'                     " Syntax highliting and indent for sxhd config file (the file used for keymaps)
"Plug 'JuliaEditorSupport/julia-vim'            " Julia support for Vim
"Plug 'romainl/vim-qf'                          " Open the quickfix window when needed
"Plug 'davidbeckingsale/writegood.vim'          " Highlight common errors in academic writing
"Plug 'l04m33/vlime', {'rtp': 'vim/'}           " environment for lisp
"Plug 'junegunn/goyo.vim'                       " Distraction Free Plugin
"Plug 'junegunn/limelight.vim'                  " Slightly dim the line that are not under cursor
"Plug 'vimwiki/vimwiki'                         " Pretty self explanatory
"Plug 'plasticboy/vim-markdown'                 " Markdown syntax highlighting
"Plug 'tpope/vim-dadbod'                        " Edit a database in VIM
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

" ===== NICE SHORTCUTS AND MAPPINGS =====
let mapleader = " "
" quicker way to change window
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
" YCM
nmap <leader>gtd :YcmCompleter GoToDefinition<CR>
nmap <leader>f :YcmCompleter FixIt<CR>

" ===== AESTETHIC =====
set cursorline
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


" ===== COLORSCHEME =====
set background=dark
colorscheme palenight
let g:airline_theme = "palenight"
highlight Comment cterm=italic gui=italic
let g:palenight_terminal_italics=1
set termguicolors


" ===== VIMTEX =====
let g:livepreview_previewer = 'zathura'
let g:tex_flavor = "latex"


" ===== MISC =====
set nu rnu " display relative number on left
" deactivate that annoying af shortcut
map q: <nop>
nnoremap Q <nop>

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

" Search in those dirs when opening file under cursor
let &path.="src/include,"
set undodir=~/.vim/undodir
set undofile
set noswapfile
set incsearch


" ===== BETTER_WHITE_SPACE =====
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1


" ===== CLANG FORMATING =====
"map <C-a> :pyf /usr/share/clang/clang-format.py<cr>
"imap <C-k> <c-o>:pyf /usr/share/clang/clang-format.py<cr>
"function! Formatonsave()
  "let l:formatdiff = 1
  "pyf /usr/share/clang/clang-format.py
"endfunction
"autocmd BufWritePre *.hh,*.hxx,*.h,*.cc,*.cpp,*.c call Formatonsave()
" Restore cursor position, window position, and last search after running a
" command.
function! Preserve(command)
  " Save the last search.
  let search = @/

  " Save the current cursor position.
  let cursor_position = getpos('.')

  " Save the current window position.
  normal! H
  let window_position = getpos('.')
  call setpos('.', cursor_position)

  " Execute the command.
  execute a:command

  " Restore the last search.
  let @/ = search

  " Restore the previous window position.
  call setpos('.', window_position)
  normal! zt

  " Restore the previous cursor position.
  call setpos('.', cursor_position)
endfunction

" Specify path to your Uncrustify configuration file.
let g:uncrustify_cfg_file_path =
    \ shellescape(fnamemodify('~/.uncrustify.cfg', ':p'))

" Don't forget to add Uncrustify executable to $PATH (on Unix) or
" %PATH% (on Windows) for this command to work.
function! Uncrustify(language)
  call Preserve(':silent %!uncrustify'
      \ . ' -q '
      \ . ' -l ' . a:language
      \ . ' -c ' . g:uncrustify_cfg_file_path)
endfunction


" ===== NERDTREE =====
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
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


" ===== GOYO / LIMELIGHT =====
"let g:goyo_width=120
"autocmd! User GoyoEnter Limelight
"autocmd! User GoyoLeave Limelight!
