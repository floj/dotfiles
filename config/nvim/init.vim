" disbale vi compatibility mode
set nocompatible

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

let g:polyglot_disabled = ['go']

call plug#begin('~/dotfiles/config/nvim/plugged')

Plug 'dense-analysis/ale'
" be sure to include vim-go before vim-polyglot
" see https://github.com/sheerun/vim-polyglot/issues/309
" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

Plug 'editorconfig/editorconfig-vim'

Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'tpope/vim-unimpaired'

" Plug 'google/vim-jsonnet'
Plug 'sheerun/vim-polyglot'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'bogado/file-line'

" Plug 'fatih/molokai'
" Plug 'liuchengxu/space-vim-dark'
Plug 'morhetz/gruvbox'
"Plug 'joshdick/onedark.vim'

Plug 'danilamihailov/beacon.nvim'

" Plug 'tweekmonster/startuptime.vim'
" Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
" Plug 'ruby-formatter/rufo-vim', { 'for': 'ruby' }
Plug 'ntpeters/vim-better-whitespace'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
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

" call neomake#configure#automake('nw', 1000)
"autocmd! BufWritePost * Neomake
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.htm PrettierAsync
autocmd BufWritePre *.tf,*.tfvars :TerraformFmt
"autocmd VimEnter * call AirlineInit()

" Highlight YAML frontmatter in Markdown files
let g:vim_markdown_frontmatter = 1
" let &runtimepath.=','.'~/.gotools/bin'

autocmd InsertLeave * :set norelativenumber
autocmd InsertEnter * :set relativenumber

" let g:neomake_sh_shellcheck_args = ['-fgcc', '-x']
" for js we use vim-prettier
" let g:neomake_javascript_enabled_makers = []

let g:rufo_auto_formatting = 1

" vmi-go stuff

let g:go_test_show_name = 1
let g:go_auto_type_info = 1
let g:go_info_mode = 'guru' " gocode
let g:go_auto_sameids = 1
let g:go_fmt_command = 'goimports' " gofmt
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


let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:ultiSnipsJumpBackwardTrigger="<c-z>"

" Force eslint for javascript
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exec = 'eslint_d'
" let g:syntastic_typescript_checkers = ['tslint', 'tsc']

let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_autoclose=1
let NERDTreeAutoDeleteBuffer = 1

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

" don't yank to register on paste in visual mode
vnoremap p "_dP
" copy to system clipboard
set clipboard=unnamedplus
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>F :NERDTreeFind<CR>
let NERDTreeShowHidden=1
" nmap <leader>p <Plug>yankstack_substitute_older_paste

nmap <C-p> :Files<CR>
nmap ' :Files<CR>
nmap ; :Buffers<CR>

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

if executable('jq')
  " autocmd FileType json setlocal equalprg=json_pp
  autocmd FileType json setlocal equalprg=jq\ .
endif

if executable('xmllint')
  autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -
endif


