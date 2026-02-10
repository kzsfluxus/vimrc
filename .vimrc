""" Alap beállítások
set nocompatible
set encoding=utf-8
set ttyfast        " Gyorsabb terminál renderelés

""" Vizuális beállítások
set number         " Sorszámozás
set background=dark
syntax on
set ruler          " Kurzor pozíció mutatása
set cmdheight=2
set laststatus=2
set showcmd        " Parancsok mutatása státuszsorban
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

""" Szerkesztési beállítások
set autoindent
set tabstop=4
set backspace=indent,eol,start
set scrolloff=8
set hidden
set mouse=a
set clipboard=unnamedplus
" set lazyredraw
set updatetime=300

""" Keresési beállítások
set ignorecase
set smartcase
set hlsearch
set incsearch
set wildmenu

""" Fájlkezelési beállítások
set nobackup        " Ne készítsen .bak fájlokat
set noswapfile     " Ne készítsen .swp fájlokat
set undofile       " Perzisztens undo
set undodir=~/.vim/undodir  " Undo fájlok helye

""" Plugin menedzser
call plug#begin('~/.vim/plugged')

" Általános kiegészítő funkciók (mindig betöltve)
" Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
Plug 'preservim/nerdtree'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'tpope/vim-commentary'
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'

" Szintaxis és nyelvi támogatás (kondicionális betöltés)
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'othree/html5.vim', {'for': ['html', 'xhtml']}
Plug 'hail2u/vim-css3-syntax', {'for': ['css', 'scss', 'sass']}
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'js']}
Plug 'leafgarland/typescript-vim', {'for': ['typescript', 'ts']}
Plug 'maxmellon/vim-jsx-pretty', {'for': ['javascript', 'javascriptreact', 'jsx']}
Plug 'jparise/vim-graphql', {'for': 'graphql'}
" Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'}
Plug 'mattn/emmet-vim', {'for': ['html', 'xhtml', 'css', 'xml', 'xsl', 'jsx', 'vue']}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'vim-perl/vim-perl', {'for': 'perl'}
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
Plug 'leafOfTree/vim-vue-plugin', {'for': 'vue'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
" Plug 'lervag/vimtex', {'for': 'tex', 'tag': 'v2.15'}
Plug 'vala-lang/vala.vim', {'for': 'vala'}

" Vizuális kiegészítők (kondicionális)
Plug 'gko/vim-coloresque', {'for': ['css', 'scss', 'sass', 'html', 'vue']}
Plug 'shmargum/vim-sass-colors', {'for': ['scss', 'sass']}

" Adatbázis kezelés (kondicionális)
Plug 'tpope/vim-dadbod', {'on': ['DB', 'DBUI']}
Plug 'kristijanhusak/vim-dadbod-ui', {'on': ['DBUI', 'DBUIToggle', 'DBUIAddConnection']}
Plug 'kristijanhusak/vim-dadbod-completion', {'for': 'sql'}

" Fájl specifikus (kondicionális)
Plug 'chrisbra/csv.vim', {'for': 'csv'}
call plug#end()

""" Színséma
colorscheme iceberg

""" Billentyűparancsok
" let mapleader = " "  " Space billentyű lesz a leader

""" Fájltípus specifikus beállítások
filetype plugin indent on
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType make setlocal noexpandtab tabstop=8
autocmd BufRead,BufNewFile *.asm set filetype=nasm

""" DadBod beállítások
let g:db_ui_save_location = '~/.config/db_ui'
let g:db_ui_use_nerd_fonts = 1
let g:db_ui_winwidth = 30
let g:db_ui_show_help = 1
let g:db_ui_auto_execute_table_helpers = 1
let g:db_ui_result_layout = 'vertical'
let g:db_ui_win_position = 'left'
let g:db_ui_disable_mappings = 0

""" DadBod billentyűparancsok
nnoremap <silent> <leader>db :DBUIToggle<CR>
nnoremap <silent> <leader>df :DBUIFindBuffer<CR>
nnoremap <silent> <leader>dr :DBUIRenameBuffer<CR>

""" VimTex beállítások
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexrun'
let g:vimtex_quickfix_mode = 1
let g:vimtex_view_automatic = 1
let maplocalleader = ","

""" Vala beállítások
if has("autocmd")
	autocmd FileType vala ValaCodingStyle
	autocmd FileType vala noremap <F8> :CCode<CR>
end

""" Syntastic beállítások
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""" NERDTree beállítások
nnoremap <F2> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=1

""" NERDTree automatizmusok
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
