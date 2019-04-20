language en_US
scriptencoding utf-8
call plug#begin('~/.local/share/nvim/plugged')

" set fileencoding=utf-8
" let NERDTreeMenuUp='t'

" DEBUG
" let g:LanguageClient_loggingLevel = 'DEBUG'

" STATUS BAR
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'airblade/vim-gitgutter'
" Git wrapper
Plug 'tpope/vim-fugitive'
" put commentary with the gc operator
Plug 'tpope/vim-commentary'
" cs : provides mappings to del, chg, add surroundings in pairs.
Plug 'tpope/vim-surround'
" Complementary pairs of mappings. Mostly fall into four categories.
Plug 'tpope/vim-unimpaired'
" add info to character revealing with ga
Plug 'tpope/vim-characterize'
" sugar for the UNIX shell commands
Plug 'tpope/vim-eunuch'
" A set of mappings for HTML, XML, PHP, ASP, eRuby, JSP, etc.
" base : <ctrl-X> <ctrl-V>
Plug 'tpope/vim-ragtag'
" Repeat.vim remaps . in a way that plugins can tap into it.
Plug 'tpope/vim-repeat'
" hilight yanks
Plug 'machakann/vim-highlightedyank'
" CamelCase and underscore_notation
Plug 'bkad/CamelCaseMotion'

" Esthetics & theme
Plug 'trevordmiller/nova-vim'

" automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'
" Snippets
" The engine.
Plug 'SirVer/ultisnips'

" Snippets implementation - separated from the engine
Plug 'honza/vim-snippets'
Plug 'justinj/vim-react-snippets'
Plug 'bentayloruk/vim-react-es6-snippets'

" Neosnipets
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Identation
" JSX
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'albfan/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}


" Autocompletion

" Deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'wokalski/autocomplete-flow'

" ternjs
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install', }
" Plug 'mhartington/nvim-typescript'

" wasm
Plug 'rhysd/vim-wasm'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
set runtimepath+=~/.local/share/nvim/plugged/LanguageClient-neovim

Plug 'ervandew/supertab' " Perform all your vim insert mode completions with Tab

" Auto import in js
Plug 'Galooshi/vim-import-js'

" fzf is a general-purpose command-line fuzzy finder.
Plug '/usr/local/opt/fzf'


" LINTING
Plug 'w0rp/ale'

call plug#end()


" Deoplete
let g:deoplete#enable_at_startup = 1

" augroup filetype_js
"     autocmd!
"     autocmd BufReadPost *.js setlocal filetype=javascript.jsx
"     autocmd BufReadPost *.jsx setlocal filetype=javascript.jsx
" augroup END

" Snippets
let g:neosnippet#enable_completed_snippet = 1

" Set general behavior (window, sounds...)
"map the "leader" key
let g:mapleader=','
set modelines=5 " nb lines (beg + end) vim checks for initializations
set updatetime=2000 " ms inactivity bfr writing 2 swap file

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set display+=lastline " as much as poss last line will be displayed. (otherwise replaced with "@" lines)
set mouse=a " enable the use of the mouse ('a'=all)

" autocomplete files relative path relative to current file (not terminal path)
set autochdir

" Set information display
set laststatus=2 " always have a status line
set list " show invisibles
set listchars=tab:▸\ ,eol:¬ " show invisibles options
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
" au VimEnter,BufWinEnter * syn match ErrorMsg " "

set number
set relativenumber

" Search options {{{2
set inccommand=split
set incsearch " show search pattern as typing

"  autcomp menu like zsh
set wildmenu
set wildmode=full

" IDE
" NERDTREETABS
" run on console at startup
let g:nerdtree_tabs_open_on_console_startup=1
"open nerdtree & put cursor into file to edit
autocmd vimenter * NERDTree | wincmd p

" Set aestethics (window, sounds...)

syntax on " lexical highlight : show syntax in diff colors
let g:airline_theme='luna'
set background=light
colorscheme solarized8_light
" colorscheme nova
highlight Normal ctermfg=lightgrey ctermbg=darkblue
" color of matching pairs
highlight MatchParen ctermbg=yellow
" color of comments
highlight Comment ctermfg=lightblue
nnoremap <CR> :nohlsearch<CR><CR> " rm search highlight

" Split, window...
" create special terminal window
command! Termb botright 5split | terminal
" To map <Esc> to exit terminal-mode:
tnoremap <Esc> <C-\><C-n>

" Shortcuts
" get to the file under cursor
nmap ;e :execute 'next ' . expand('<cfile>')<CR>
nmap ;o :echo expand('<cfile>')

" Edit config & plugin files quickly
let $MYVIMPLUG=fnamemodify($MYVIMRC, ':p:h'). '/plug_manager.vim'
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>ep :vsplit $MYVIMPLUG<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

let g:loaded_matchit = 1
" runtime macros/matchit.vim
" default matchpairs: "(:),[:],{:},"
" set matchpairs+=<:>


" Autocompletion
" leave preview window when completion done or left
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" JavaScript
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = ['LanguageClient#Complete','ternjs']

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }

" deoplete ternjs
let g:deoplete#sources#ternjs#types = 1 " include the type of the var or data
let g:deoplete#sources#ternjs#docs = 1 " include a window with documentation
let g:deoplete#sources#ternjs#depths = 1 " dist in scope (var) or proto (prop)


" Use tern_for_vim.
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1

" deoplete sources
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs'] ", 'LanguageClient']
let g:deoplete#sources['javascript'] = ['file', 'ultisnips', 'LanguageClient']

" Language client (LSP)
set hidden
"     \ 'javascript': ['javascript-typescript-stdio'],
let g:LanguageClient_serverCommands = {
      \ 'javascript': ['flow-language-server', '--stdio'],
      \ 'javascript.jsx': ['language-server-stdio'],
      \ 'typescript': ['language-server-stdio'],
      \ 'html': ['html-languageserver', '--stdio'],
      \ 'css': ['css-languageserver', '--stdio'],
      \ 'sass': ['css-languageserver', '--stdio'],
      \ 'scss': ['css-languageserver', '--stdio'],
      \ 'python': ['pyls'],
      \ }

" call deoplete#enable_logging('DEBUG', '/Users/godot/.config/nvim/log/deoplete.log')

" ALE
let g:ale_completion_enabled = 1
" prettier in included in the eslint config!!
" Flake8 is a wrapper around PyFlakes, pycodestyle, Ned Batchelder’s McCabe script
let g:ale_linters = {'javascript': ['eslint'], 'javascript.jsx': ['eslint'], 'python': ['flake8', 'vulture'], 'vim': ['vint'], 'r': ['lintr'], 'reason': ['merlin'], 'docker': ['hadolint'], 'cpp': ['clang', 'clang-format', 'cppcheck', 'cpplint'], 'haskell': ['hlint', 'hdevtools', 'hfmt']}

let g:ale_fixers = {'javascript': ['eslint'], 'javascript.jsx': ['eslint'], 'python': ['autopep8', 'isort'],'cpp': ['clang-format'], 'haskell': ['hfmt']}
let g:ale_python_autopep8_options = '--aggressive'
let g:ale_fix_on_save = 1
let g:ale_emit_conflict_warnings = 1


" match pairs
" inoremap " ""<left>
" inoremap ' ''<left>
"inoremap " <c-r>=QuoteDelim('"')<CR>
"inoremap ' <c-r>=QuoteDelim("'")<CR>
inoremap <expr> <BS> DeleteEmptyPairs()

inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

autocmd Syntax html,vim inoremap < <lt>><Left>

inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=ClosePair('}')<CR>

vnoremap (  <ESC>`>a)<ESC>`<i(<ESC>
vnoremap )  <ESC>`>a)<ESC>`<i(<ESC>
vnoremap {  <ESC>`>a}<ESC>`<i{<ESC>
vnoremap }  <ESC>`>a}<ESC>`<i{<ESC>
" vnoremap "  <ESC>`>a"<ESC>`<i"<ESC>
" vnoremap '  <ESC>`>a'<ESC>`<i'<ESC>
" vnoremap `  <ESC>`>a`<ESC>`<i`<ESC>
vnoremap [  <ESC>`>a]<ESC>`<i[<ESC>
vnoremap ]  <ESC>`>a]<ESC>`<i[<ESC>

function! ClosePair(char)
  " get current line
  " echom 'shit, this works!: ' . getline('.')[col('.') - 1]
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endf

function! QuoteDelim(char)
  let l:line = getline('.')
  let l:col = col('.')
  if l:line[l:col - 2] ==# "\\"
    "Inserting a quoted quotation mark into the string
    return a:char
  elseif l:line[l:col - 1] ==# a:char
    "Escaping out of the string
    return "\<Right>"
    "Starting a string
    return a:char.a:char."\<Left>"
  endif
endf

function! InAnEmptyPair()
  let l:cur = strpart(getline('.'),getpos('.')[2]-2,2)
  for l:pair in (split(&matchpairs,',') + ['":"',"':'"])
    if l:cur == join(split(l:pair,':'),'')
      return 1
    endif
  endfor
  return 0
endfunc

func! DeleteEmptyPairs()
  if InAnEmptyPair()
    return "\<Left>\<Del>\<Del>"
  else
    return "\<BS>"
  endif
endfunc

set expandtab
