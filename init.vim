call plug#begin('~/AppData/Local/nvim/plugged')
" below are some vim plugins for demonstration purpose.
" add the plugin you want to use here.
Plug 'natebosch/vim-lsc'
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc-dart'
""Plug 'iamcco/coc-flutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dart-vim-plugin'
Plug 'morhetz/gruvbox'
Plug 'dikiaap/minimalist'
Plug 'preservim/NERDTree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:dart_style_guide = 2
let dart_html_in_string=v:true
let g:lsc_auto_map = v:true

nmap <F6> :NERDTreeToggle<CR>

nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>

"Elenco impostazioni per ambiente NVim
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
:set undolevels=30
:set ruler
:set number relativenumber
:set nowrap
:set guifont=Consolas:h14
":set guifont=Liberation_Mono:h14
:set lines=100 columns=120 linespace=0
:set cursorline
colorscheme gruvbox
syntax on
