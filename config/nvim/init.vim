" disbale vi compatibility mode
set nocompatible

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

call plug#begin('~/.config/nvim/plugged')

Plug 'neomake/neomake'
" be sure to include vim-go before vim-polyglot
" see https://github.com/sheerun/vim-polyglot/issues/309
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make' }

Plug 'editorconfig/editorconfig-vim'

" Plug 'w0rp/ale'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" Plug 'godlygeek/tabular'
" Plug 'chrisbra/csv.vim'

"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

Plug 'itchyny/lightline.vim'

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
" Plug 'tpope/vim-sleuth'

Plug 'tpope/vim-unimpaired'

Plug 'sheerun/vim-polyglot'

" Plug 'leafgarland/typescript-vim'
" Plug 'elixir-lang/vim-elixir'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'bogado/file-line'

" Plug 'fatih/molokai'
" Plug 'liuchengxu/space-vim-dark'
Plug 'morhetz/gruvbox'
"Plug 'joshdick/onedark.vim'

" Plug 'tweekmonster/startuptime.vim'
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'ruby-formatter/rufo-vim', { 'for': 'ruby' }

call plug#end()

" background fix for vim in tmux
" set t_ut=
set shell=/bin/bash
set termguicolors

syntax on                   " Enable syntax highlighting
set filetype=on             " Enable filetype plugins
filetype plugin indent on

set mouse=a                    " allow mouse interaction
set undolevels=1000            " How many undos
set undoreload=20000           " number of lines to save for undo
set undofile                   " Save undo's after file closes
set undodir=$HOME/.vimundo     " where to save undo histories
set autoread                   " Set to auto read when a file is changed from the outside
set scrolloff=7                " Set 7 lines to the cursor - when moving vertically using j/k
set wildmenu                   " Turn on the WiLd menu
set wildignore=*.o,*~,*.pyc    " Ignore compiled files
set ruler                      " Always show current position
set cmdheight=2                " Height of the command bar
set backspace=eol,start,indent " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l
set ignorecase                 " Ignore case when searching
set smartcase                  " When searching try to be smart about cases 
set lazyredraw                 " Don't redraw while executing macros (good performance config)
set hlsearch                   " Highlight search results
set incsearch                  " Makes search act like search in modern browsers
set showmatch                  " Show matching brackets when text indicator is over them
set mat=2                      " How many tenths of a second to blink when matching brackets
set title
set novisualbell
set noerrorbells
set encoding=utf8              " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac           " Use Unix as the standard file type
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set autoindent
"set copyindent
set number
set shiftround
set expandtab
set cursorline

autocmd InsertEnter * setlocal cursorcolumn
autocmd InsertLeave * setlocal nocursorcolumn

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set noswapfile
set nowritebackup

set hidden   " allow to switch beetween unsaved buffers

" Use the same symbols as TextMate for tabstops and EOLs
set list
set listchars=tab:▸\ 
" set listchars=tab:▸\ ,eol:¬


" Save files which require root permission
cmap w!! %!sudo tee > /dev/null %

" let g:rehash256=1 
set background=dark
" colorscheme molokai
" colorscheme zenburn

let g:gruvbox_italic=1
colorscheme gruvbox
" colorscheme space-vim-dark


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


set viminfo^=%   " Remember info about open buffers on close

call neomake#configure#automake('nw', 1000)
"autocmd! BufWritePost * Neomake

autocmd BufWritePre *.rb,*.js,*.haml,*.sass,*.htm,*.html,*.xml,*.gemspec,Gemfile :call <SID>StripTrailingWhitespaces()
"autocmd VimEnter * call AirlineInit()

" Highlight YAML frontmatter in Markdown files
let g:vim_markdown_frontmatter = 1
" let &runtimepath.=','.'~/.gotools/bin'


" ALE
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_sign_warning = '▲'
" let g:ale_sign_error = '✗'
" let g:ale_linters = {
"      \ 'go': 'all',
"      \ }

" highlight link ALEWarningSign String
" highlight link ALEErrorSign Title


autocmd InsertLeave * :set norelativenumber
autocmd InsertEnter * :set relativenumber

let g:neomake_sh_shellcheck_args = ['-fgcc', '-x']

let g:rufo_auto_formatting = 1

" vmi-go stuff

let g:go_test_show_name = 1
let g:go_auto_type_info = 1
let g:go_info_mode = 'guru' " gocode
let g:go_auto_sameids = 1
let g:go_fmt_command = 'goimports' " gofmt
let g:go_bin_path = expand('~/.gotools/bin')
" let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" let g:go_metalinter_disabled = []
let g:go_addtags_transform = 'camelcase'


let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1 
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_variable_declarations = 1
" let g:go_highlight_variable_assignments = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources#go#gocode_binary = expand('~/.gotools/bin/gocode')
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
set completeopt+=noselect

let g:polyglot_disabled = ['go']

let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Force eslint for javascript
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exec = 'eslint_d'
" let g:syntastic_typescript_checkers = ['tslint', 'tsc']

let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_autoclose=1

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" let g:fzz_search_cmd = "pt --nogroup --nocolor"

if executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat^=%f:%l:%c:%m
elseif executable('ag')
  set grepprg=ag
  let g:grep_cmd_opts = '--line-numbers --noheading --nocolor'
endif

let mapleader=","

" copy to system clipboard
set clipboard=unnamedplus
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>F :NERDTreeFind<CR>
let NERDTreeShowHidden=1
" nmap <leader>p <Plug>yankstack_substitute_older_paste

nmap <C-p> :Files<CR>
nmap ' :Files<CR>
nmap ; :Buffers<CR>

"
" Functions
"
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" function! AirlineInit()
  
"   let g:airline#extensions#tabline#enabled = 1
  
"   if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
"   endif

"   " unicode symbols
"   let g:airline_left_sep = '▶'
"   let g:airline_right_sep = '◀'
"   let g:airline_symbols.linenr = '¶'
"   " " let g:airline_symbols.branch = '⎇'
"   let g:airline_symbols.branch = ''
"   let g:airline_symbols.paste = ''
"   let g:airline_symbols.whitespace = 'Ξ'
"   let g:airline_symbols.readonly = ''

" endfunction

if executable('jq')
  " autocmd FileType json setlocal equalprg=json_pp
  autocmd FileType json setlocal equalprg=jq\ .
endif

if executable('xmllint')
  autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -
endif

if executable('prettier')
  autocmd FileType javascript setlocal equalprg=prettier\ --stdin\ --trailing-comma\ es5
endif

